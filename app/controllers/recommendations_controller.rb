class RecommendationsController < ApplicationController
  layout "application_compras"
  before_action :set_recommendation, only: [:show, :edit, :update, :destroy]

  def index
    if current_user
    if current_user.acquisition? || current_user.import?  || current_user.acquisition_analist? || current_user.import_analist? 
    @especificacion = Specification.where(:id => session[:specification_sel_id]).first 
    @user = User.where(:username => @especificacion.user_id).first 
        if @user.director? || @user.directorate? || @user.gsmp? || @user.acquisition? || @user.import? || @user.quality? || @user.manage? || @user.acquisition_analist? || @user.import_analist? || @user.quality_analist? || @user.manage_analist?
            @mostrar = true
        else
            @mostrar = false
        end
    elsif current_user.director? || current_user.directorate? || current_user.gsmp? || current_user.quality? || current_user.quality_analist? || current_user.manage? || current_user.manage_analist? || current_user.section_boss? || current_user.proy_responsible?
        @mostrar = false
    else
    @mostrar = true
    end
    @recommendations = Recommendation.where(:specification_id => session[:specification_sel_id]).all
    @sumRec = Recommendation.where(:specification_id => session[:specification_sel_id]).count
    @reco = Recommendation.where(:specification_id => session[:specification_sel_id]).first
    end
    respond_to do |format|
	      format.html do
          if @sumRec != 0
            redirect_to @reco
          else
            redirect_to new_recommendation_url
          end
        end
	      format.pdf do
		
		@invt = Invitation.where(:specification_id => session[:specification_sel_id]).order('nombre ASC')
		@recoEmp = RecommendationsEmpresa.where(:id_informe => @reco.id).order('empresa ASC')
		@itemsq = Itemsquote.where(:specification_id => session[:specification_sel_id]).all
    @fecha = Invitation.where(:specification_id => session[:specification_sel_id]).order('created_at DESC').first
		pdf = ReporteRecommendations.new(@reco, @recoEmp, @invt, @itemsq, @fecha)
		nombre = "Especificacion_#{session[:specification_sel_id]}_Informe_Recomendacion.pdf"
		send_data pdf.render, filename: nombre, type: 'application/pdf'
	      end
	      format.xml do
              specification = Specification.find(session[:specification_sel_id])
	       specification.p2 = 2
	       specification.p3 = 2
	       specification.p4 = 2
	       specification.p5 = 0
	       specification.p6 = 1
               specification.p8 = 1
	       session[:specification_p3] = specification.p3
	    session[:specification_p2] = specification.p2
	    session[:specification_p4] = specification.p4
	    session[:specification_p5] = specification.p5
	    session[:specification_p6] = specification.p6
	    session[:specification_p8] = specification.p8
	    specification.save
              redirect_to "/recommendations/#{@reco.id}?pdf=1"
      end
      end
   	
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
    @especificacion = Specification.where(:id => session[:specification_sel_id]).first 
    @user = User.where(:username => @especificacion.user_id).first 

     if current_user.acquisition? || current_user.import? 
            @mostrar_editar = true
     elsif current_user.acquisition_analist? || current_user.import_analist? 
	    if @user.director? || @user.directorate? || @user.gsmp? || @user.acquisition? || @user.import? || @user.quality? || @user.manage? || @user.acquisition_analist? || @user.import_analist? || @user.quality_analist? || @user.manage_analist? 
		@mostrar_editar = true
            else
		@mostrar_editar = false
            end
    elsif current_user.director? || current_user.directorate? || current_user.gsmp? || current_user.quality? || current_user.quality_analist? || current_user.manage? || current_user.manage_analist? || current_user.section_boss? || current_user.proy_responsible?
	@mostrar_editar = false
    else
	@mostrar_editar = true
    end


     if current_user.acquisition? || current_user.import? 
	    if @user.director? || @user.directorate? || @user.gsmp? || @user.acquisition? || @user.import? || @user.quality? || @user.manage? || @user.acquisition_analist? || @user.import_analist? || @user.quality_analist? || @user.manage_analist? 
                @mostrar_eliminar = true
            else
                @mostrar_eliminar = false
            end
     elsif current_user.acquisition_analist? || current_user.import_analist? 
	    if @user.director? || @user.directorate? || @user.gsmp? || @user.acquisition? || @user.import? || @user.quality? || @user.manage? || @user.acquisition_analist? || @user.import_analist? || @user.quality_analist? || @user.manage_analist? 
                @mostrar_eliminar = true
            else
                @mostrar_eliminar = false
            end
    elsif current_user.director? || current_user.directorate? || current_user.gsmp? || current_user.quality? || current_user.quality_analist? || current_user.manage? || current_user.manage_analist? || current_user.section_boss? || current_user.proy_responsible?
	@mostrar_eliminar = false
    else
	@mostrar_eliminar = true
    end


    if current_user.acquisition?
	if @user.acquisition? || @user.acquisition_analist?
	    @mostrar_validar = true
	else
	    @mostrar_validar = false
	end
    elsif current_user.import?
	if @user.import? || @user.import_analist?
	    @mostrar_validar = true
	else
	    @mostrar_validar = false
	end
    elsif current_user.director? || current_user.directorate? || current_user.gsmp? || current_user.acquisition_analist? || current_user.import_analist? || current_user.quality? || current_user.quality_analist? || current_user.manage? || current_user.manage_analist? || current_user.labassistant? || current_user.proy_responsible?
	@mostrar_validar = false
    else
	@mostrar_validar = true
    end


    if current_user.gsmp? || current_user.quality? || current_user.quality_analist? || current_user.manage? || current_user.manage_analist?
	@mostrar_descargar = false
    else
	@mostrar_descargar = true
    end


     @recommendation = Recommendation.where(:specification_id => session[:specification_sel_id]).first
     @empresas_todas = Invitation.where(:specification_id => session[:specification_sel_id]).all
     @empresas = RecommendationsEmpresa.where(:id_informe => @recommendation.id).all
     @itemsquote = Itemsquote.where(:specification_id => session[:specification_sel_id]).all
  end

  # GET /quotes/new
  def new
        num = Recommendation.where(:specification_id => session[:specification_sel_id]).count
	if num != 0
	@recommendation = Recommendation.where(:specification_id => session[:specification_sel_id]).first
        else
    	@recommendation = Recommendation.new
        end
    @quotes = Quote.where(:specification_id => session[:specification_sel_id]).order('nombre ASC')
    @itemsquotes = Itemsquote.where(:specification_id => session[:specification_sel_id]).all
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes
  # POST /quotes.json
  def create
        num = Recommendation.where(:specification_id => session[:specification_sel_id]).count
	if num != 0
		@recommendation = Recommendation.where(:specification_id => session[:specification_sel_id]).first
		@recommendation.destroy
        end
    @recommendation = Recommendation.new(recommendation_params)
    @recommendation.user_id = current_user.username
    @invt = Invitation.where(:specification_id => session[:specification_sel_id]).first
    @recommendation.responsale = @invt.responsable
    @recommendation.specification_id = session[:specification_sel_id]
    @recommendation.responsale = @recommendation.responsale.upcase
    @recommendation.save
    specification = Specification.find(session[:specification_sel_id])
	session[:specification_sel_nacional] = "Nacional"
	specification.nacional = "Nacional"
	specification.save
    params.each do |k,x|
    if k.include?("recommendation_empresas")
      ind = k.gsub("recommendation_empresas", "")
      @nuevoElemento = RecommendationsEmpresa.new
      @nuevoElemento.quote_id = params["quoteid#{ind}"]
      @nuevoElemento.id_informe = @recommendation.id
      @nuevoElemento.opcion_numero = params["prioridad#{ind}"]
      @nuevoElemento.empresa = params["empresa#{ind}"]
      @numin = Invitation.where(:specification_id => session[:specification_sel_id], :nombre => params["empresa#{ind}"], :tipo => "Internacional").count
      if @numin != 0
	specification = Specification.find(session[:specification_sel_id])
	session[:specification_sel_nacional] = "Internacional"
	specification.nacional = "Internacional"
	specification.save
      end
      @nuevoElemento.calidad_pro = params["calidadProd#{ind}"]
      @nuevoElemento.disponibilidad_pro = params["disponibilidad#{ind}"]
      @nuevoElemento.proveedor_unico = params["proveedorU#{ind}"]
      @nuevoElemento.calidad_ser = params["calidadServ#{ind}"]
      @nuevoElemento.garantia = params["garantia#{ind}"]
      @nuevoElemento.servicio_post = params["servicioPV#{ind}"]
      @nuevoElemento.cumplimiento_esp = params["cumplimientoEsp#{ind}"]
      @nuevoElemento.precio = params["precio#{ind}"]
      @nuevoElemento.tiempo = params["tiempoE#{ind}"]
      @nuevoElemento.cumplio_req = 1
      @nuevoElemento.save
      @quotes = Itemsquote.where(:id_oferta => params["quoteid#{ind}"]).all
      @quotes.each do |quot|
	quot.compra = 1
	quot.save
      end
    end
    end

    respond_to do |format|
     
        format.html { redirect_to recommendations_url, notice: 'Recommendation was successfully created.' }
        format.json { render :show, status: :created, location: @Recommendation }
   
    end
  end

  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
    create
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @recommendation = Recommendation.where(:specification_id => session[:specification_sel_id]).first
    @recommendation.destroy
    respond_to do |format|
      format.html { redirect_to recommendations_url, notice: 'Recommendation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recommendation
      @recommendation = Recommendation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recommendation_params
      params.require(:recommendation).permit(:codigo,:via, :responsale)
    end
end
