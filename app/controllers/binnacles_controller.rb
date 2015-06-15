class BinnaclesController < ApplicationController
  layout 'bootlayout'
  before_action :set_binnacle, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  responders :flash
  respond_to :html, :json

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
    if params[:errors]
      @errors = params[:errors]
    end
    if params[:formato]
      @id = params[:formato]
    else
      @id = params[:format]
    end
    @sustancias = ChemicalSubstance.where(id2: @id)

    @sustancias.each do |sustancia|
      @unidad = "#{sustancia.meassure}"
      @nombre = "#{sustancia.name}"
    end
  end

  def edit

    if params[:errors]
      @errors = params[:errors]
    end
    
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
          @modificar.each do |md|
            @ingresos2 = Binnacle.where(idSustancia: @binnacle.idSustancia).where("fecha <= ?", md.fecha).sum(:ingreso)
            @consumos2 = Binnacle.where(idSustancia: @binnacle.idSustancia).where("fecha <= ?", md.fecha).sum(:consumo)
            @total2 = @ingresos2 - @consumos2
            md.total = @total2
            md.save
          end
        end
        f.html { redirect_to @binnacle }
        f.json { render :show, status: :created, location: @binnacle }
      else
        f.html { redirect_to action: :new, :formato => @binnacle.idSustancia, :errors => @binnacle.errors.full_messages }
        f.json { render json: @binnacle.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    #@binnacle.update(binnacle_params)
    respond_to do |f|
      if @binnacle.update(binnacle_params)
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
          @modificar.each do |md|
            @ingresos2 = Binnacle.where(idSustancia: @binnacle.idSustancia).where("fecha <= ?", md.fecha).sum(:ingreso)
            @consumos2 = Binnacle.where(idSustancia: @binnacle.idSustancia).where("fecha <= ?", md.fecha).sum(:consumo)
            @total2 = @ingresos2 - @consumos2
            md.total = @total2
            md.save
          end
        end
        f.html { redirect_to @binnacle }
        f.json { render :show, status: :updated, location: @binnacle }
      else
        f.html { redirect_to action: :edit, :formato => @binnacle.idSustancia, :errors => @binnacle.errors.full_messages }
        f.json { render json: @binnacle.errors, status: :unprocessable_entity }
      end
    end
    #respond_with(@binnacle)
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
