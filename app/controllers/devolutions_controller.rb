class DevolutionsController < ApplicationController
  layout "application_compras"
  respond_to :html, :xml, :json
  before_action :set_devolution, only: [:show, :edit, :update, :destroy]

  # GET /devolutions
  # GET /devolutions.json
  def index
    if current_user
        @devolutions = Devolution.where(:specification_id => session[:specification_sel_id]).first
        @sumDevolution = Devolution.where(:specification_id => session[:specification_sel_id]).count
        if @sumDevolution ==0
			redirect_to "/devolutions/new"
		else
			redirect_to "/devolutions/#{@devolutions.id}"
        end
    end
  end

  # GET /devolutions/1
  # GET /devolutions/1.json
  def show
    @devolution = Devolution.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReporteDevolutions.new(@devolution)
        send_data pdf.render, filename: 'Nota_Devolucion.pdf', type: 'application/pdf'
      end
    end
  end

  # GET /devolutions/new
  def new
    @devolution = Devolution.new
  end

  # GET /devolutions/1/edit
  def edit
  end

  # POST /devolutions
  # POST /devolutions.json
  def create
    @devolution = Devolution.new(devolution_params)
    @devolution.user_id = current_user.username
    @devolution.specification_id = session[:specification_sel_id]
    @devolution.observaciones = @devolution.observaciones.upcase
    @devolution.otro_especifico = @devolution.otro_especifico.upcase
    @devolution.unidadSolicitante = @devolution.unidadSolicitante.upcase


    respond_to do |format|
      if @devolution.save
        format.html { redirect_to devolutions_url, notice: 'Devolution was successfully created.' }
        format.json { render :show, status: :created, location: @devolution }
      else
        format.html { render :new }
        format.json { render json: @devolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devolutions/1
  # PATCH/PUT /devolutions/1.json
  def update
    @devolution.update(devolution_params)
    @devolution.observaciones = @devolution.observaciones.upcase
    @devolution.otro_especifico = @devolution.otro_especifico.upcase
    @devolution.unidadSolicitante = @devolution.unidadSolicitante.upcase
    respond_to do |format|
      if @devolution.save
        format.html { redirect_to devolutions_url, notice: 'Devolution was successfully updated.' }
        format.json { render :show, status: :ok, location: @devolution }
      else
        format.html { render :edit }
        format.json { render json: @devolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devolutions/1
  # DELETE /devolutions/1.json
  def destroy
    @devolution.destroy
    respond_to do |format|
      format.html { redirect_to devolutions_url, notice: 'Devolution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_devolution
      @devolution = Devolution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def devolution_params
      params.require(:devolution).permit(:numRegistro, :numRequisicion, :requisicion, :numAutorizacion, :autorizacion, :numCertificacion, :otro_especifico, :certificacion, :numSolicitud, :solicitud, :numInforme, :informe, :numOtro, :otro, :disponibilidad, :idioma, :discriminado, :firma, :carencia, :nombre, :direccion, :datos, :rif, :telefonos, :persona, :otroCarencia, :contacto, :copia, :factura, :foto, :observaciones, :unidadSolicitante)
    end
end
