class BinnaclesController < ApplicationController
  layout 'bootlayout'
  before_action :set_binnacle, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  responders :flash
  respond_to :html

  def index
    if params[:format]
      @binnacles = Binnacle.where(idSustancia: params[:format]).order('fecha ASC, created_at ASC')
      @ingresos = Binnacle.where(idSustancia: params[:format]).sum(:ingreso)
      @consumos = Binnacle.where(idSustancia: params[:format]).sum(:consumo)
    end
    @sustancias = ChemicalSubstance.where(id2: params[:format])
    @sustancias.each do |sustancia|
      @unidad = "#{sustancia.meassure}"
    end
    @total = @ingresos - @consumos
    @id = params[:format]
  end

  def show
    @id = @binnacle.idSustancia
    @sustancias = ChemicalSubstance.where(id2: @id)
    @sustancias.each do |sustancia|
      @unidad = "#{sustancia.meassure}"
    end
  end

  def new
    @binnacle = Binnacle.new
    if params[:format]
      @id = params[:format]
    else
      @id = params[:formato]
    end
    @sustancias = ChemicalSubstance.where(id2: @id)

    @sustancias.each do |sustancia|
      @unidad = "#{sustancia.meassure}"
      @nombre = "#{sustancia.name}"
    end

  end

  def edit

    @id = @binnacle.idSustancia
    @sustancias = ChemicalSubstance.where(id2: @id)
    @sustancias.each do |sustancia|
      @unidad = "#{sustancia.meassure}"
    end

  end

  def create
    @binnacle = Binnacle.new(binnacle_params)
    respond_to do |f|
      if @binnacle.save
        @ingresos = Binnacle.where(idSustancia: @binnacle.idSustancia).where("fecha <= ?", @binnacle.fecha).sum(:ingreso)
        @consumos = Binnacle.where(idSustancia: @binnacle.idSustancia).where("fecha <= ?", @binnacle.fecha).sum(:consumo)
        @binnacle.total = @ingresos - @consumos
        @binnacle.save
        @sustancia = ChemicalSubstance.where(id2: @binnacle.idSustancia)
        @sustancia.each do |sustancia|
          @minimo = sustancia.min
          @email = sustancia.correo
        end
        if @binnacle.total < @minimo
          BinnacleMailer.binnacle_email(@email,@sustancia).deliver
        end
        if Binnacle.where(idSustancia: @binnacle.idSustancia).where("fecha > ?", @binnacle.fecha).exists?
          @modificar = Binnacle.where(idSustancia: @binnacle.idSustancia).where("fecha > ?", @binnacle.fecha)
          @modificar.each do |modificar|
            @ingresos2 = Binnacle.where(idSustancia: @binnacle.idSustancia).where("fecha <= ?", modificar.fecha).where('created_at < ?', modificar.created_at).sum(:ingreso)
            @consumos2 = Binnacle.where(idSustancia: @binnacle.idSustancia).where("fecha <= ?", modificar.fecha).where('created_at < ?', modificar.created_at).sum(:consumo)
            @total2 = @ingresos2 - @consumos2
            modificar.update(total: @total2)
          end
        end
        f.html { redirect_to @binnacle }
        f.json { render :show, status: :created, location: @binnacle }
      else
        f.html { render :new }
        f.json { render json: @binnacle.errors(binnacle_params), status: :unprocessable_entity }
      end
    end
  end

  def update
    @binnacle.update(binnacle_params)
    respond_with(@binnacle)
  end

  def destroy
    @binnacle.destroy
    respond_with(@binnacle)
  end

  private
    def set_binnacle
      @binnacle = Binnacle.find(params[:id])
    end

    def binnacle_params
      params.require(:binnacle).permit(:idSustancia, :fecha, :tipo, :consumo, :ingreso, :descripcion, :total)
    end
end
