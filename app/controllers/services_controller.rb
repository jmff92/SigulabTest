class ServicesController < ApplicationController
  layout "application_compras"
  respond_to :html, :xml, :json
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services/
  # GET /services/json
  def index
    if current_user
    	@services = Service.where(:specification_id => session[:specification_sel_id]).all
      @sumService = Service.where(:specification_id => session[:specification_sel_id]).count
	 end
specification = Specification.find(session[:specification_sel_id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReporteServices.new(@services, specification)
        nombre = "Especificacion_#{session[:specification_sel_id]}.pdf"
        send_data pdf.render, filename: nombre, type: 'application/pdf'
      end
	format.xml do
      specification.p1 = 2
        specification.p2 = 1
        specification.save
        session[:specification_p2] = 1
        session[:specification_p1] = 2
      redirect_to "/services?pdf=1"
      end
    end
  end

  # GET /items/1.json
  def show
	specification = Specification.find(session[:specification_sel_id])
    if specification.user_id == current_user.username
		@propio = true
	else
		@propio = false
	end
	if current_user.quality? 
		@user = User.where(:username => current_user.username).first
		if @user.quality? || @user.quality_analist?
			@propio = true
		end
	end
	if current_user.manage? 
		@user = User.where(:username => current_user.username).first
		if @user.manage? || @user.manage_analist?
			@propio = true
		end
	end
  end
  
  # GET /services/new
  def new
    @item = Equipment.all.where(id2: params[:format])
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)
    @service.user_id = current_user.username
    @service.nombre = @service.nombre.upcase
    @service.tipo = @service.tipo.upcase
    @service.descripcion = @service.descripcion.upcase
    @service.ubicacion = @service.ubicacion.upcase

    respond_to do |format|
      if @service.save
        format.html { redirect_to services_url, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    @service.update(service_params)
    @service.nombre = @service.nombre.upcase
    @service.tipo = @service.tipo.upcase
    @service.descripcion = @service.descripcion.upcase
    @service.ubicacion = @service.ubicacion.upcase
    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:nombre, :numero, :tipo, :descripcion, :ubicacion, :specification_id)
    end
end
