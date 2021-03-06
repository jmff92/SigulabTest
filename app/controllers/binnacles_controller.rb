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
      @minimo = sustancia.min
      @email = sustancia.correo
    end
    @total = @ingresos - @consumos
    @id = params[:format]
    if params[:elimino]
      if @total < @minimo
        BinnacleMailer.binnacle_email(@email,@sustancias).deliver
      end
    end
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
        @ingresos = Binnacle.where(idSustancia: @binnacle.idSustancia).where("(fecha < ?) OR (fecha = ? AND created_at < ?)", @binnacle.fecha, @binnacle.fecha, @binnacle.created_at).sum(:ingreso)
        @consumos = Binnacle.where(idSustancia: @binnacle.idSustancia).where("(fecha < ?) OR (fecha = ? AND created_at < ?)", @binnacle.fecha, @binnacle.fecha, @binnacle.created_at).sum(:consumo)
        @binnacle.total = (@ingresos + @binnacle.ingreso) - (@consumos + @binnacle.consumo)
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
            @ingresos2 = Binnacle.where(idSustancia: @binnacle.idSustancia).where("(fecha < ?) OR (fecha = ? AND created_at < ?)", md.fecha, md.fecha, md.created_at).sum(:ingreso)
            @consumos2 = Binnacle.where(idSustancia: @binnacle.idSustancia).where("(fecha < ?) OR (fecha = ? AND created_at < ?)", md.fecha, md.fecha, md.created_at).sum(:consumo)
            @total2 = (@ingresos2 + md.ingreso) - (@consumos2 + md.consumo)
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
    
    respond_to do |f|
      if @binnacle.update(binnacle_params)
        @ingresos = Binnacle.where(idSustancia: @binnacle.idSustancia).where("(fecha < ?) OR (fecha = ? AND created_at < ?)", @binnacle.fecha, @binnacle.fecha, @binnacle.created_at).sum(:ingreso)
        @consumos = Binnacle.where(idSustancia: @binnacle.idSustancia).where("(fecha < ?) OR (fecha = ? AND created_at < ?)", @binnacle.fecha, @binnacle.fecha, @binnacle.created_at).sum(:consumo)
        @binnacle.total = (@ingresos + @binnacle.ingreso) - (@consumos + @binnacle.consumo)
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
            @ingresos2 = Binnacle.where(idSustancia: @binnacle.idSustancia).where("(fecha < ?) OR (fecha = ? AND created_at < ?)", md.fecha, md.fecha, md.created_at).sum(:ingreso)
            @consumos2 = Binnacle.where(idSustancia: @binnacle.idSustancia).where("(fecha < ?) OR (fecha = ? AND created_at < ?)", md.fecha, md.fecha, md.created_at).sum(:consumo)
            @total2 = (@ingresos2 + md.ingreso) - (@consumos2 + md.consumo)
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
    
  end

  def destroy
    @id = @binnacle.idSustancia
    @aux = @binnacle
    respond_to do |f|
      if @binnacle.destroy
        if Binnacle.where(idSustancia: @aux.idSustancia).where("fecha > ?", @aux.fecha).exists?
          @modificar = Binnacle.where(idSustancia: @aux.idSustancia).where("fecha > ?", @aux.fecha)
          @modificar.each do |md|
            @ingresos2 = Binnacle.where(idSustancia: @aux.idSustancia).where("(fecha < ?) OR (fecha = ? AND created_at < ?)", md.fecha, md.fecha, md.created_at).sum(:ingreso)
            @consumos2 = Binnacle.where(idSustancia: @aux.idSustancia).where("(fecha < ?) OR (fecha = ? AND created_at < ?)", md.fecha, md.fecha, md.created_at).sum(:consumo)
            @total2 = (@ingresos2 + md.ingreso) - (@consumos2 + md.consumo)
            md.total = @total2
            md.save
          end
        end
        f.html { redirect_to action: :index, format: @id, elimino: "Vengo de eliminar" }
      else
        f.html { redirect_to @binnacle }
      end
    end
    
  end

  private
    def set_binnacle
      @binnacle = Binnacle.find(params[:id])
    end

    def binnacle_params
      params.require(:binnacle).permit(:idSustancia, :fecha, :tipo, :consumo, :ingreso, :descripcion, :total)
    end
end
