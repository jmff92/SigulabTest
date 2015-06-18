class ActsController < ApplicationController
  layout "application_compras"
  before_action :set_act, only: [:show, :edit, :update, :destroy]

  # GET /acts
  # GET /acts.json
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
    	@acts = Act.where(:specification_id => session[:specification_sel_id]).all
        @sumActs = Act.where(:specification_id => session[:specification_sel_id]).count
	@act= Act.where(:specification_id => session[:specification_sel_id]).first
    end
	respond_to do |format|
      format.html do
          if @sumActs != 0
            redirect_to @act
          else
			redirect_to new_act_url
          end
	end
      format.pdf do
		pdf = ReporteActs.new(@act)
      		  send_data pdf.render, filename: "Especificacion_#{session[:specification_sel_id]}_Acto_Motivado.pdf", type: 'application/pdf'
	      end
       format.xml do
              specification = Specification.find(session[:specification_sel_id])
       specification.p2 = 2
       specification.p3 = 2
       specification.p4 = 0
       specification.p5 = 2
       specification.p6 = 1
       specification.p8 = 1
       session[:specification_p3] = specification.p3
    session[:specification_p2] = specification.p2
    session[:specification_p4] = specification.p4
    session[:specification_p5] = specification.p5
    session[:specification_p6] = specification.p6
    session[:specification_p8] = specification.p8
    specification.save
              redirect_to "/acts/#{@act.id}?pdf=1"
      end
    end
  end

  # GET /acts/1
  # GET /acts/1.json
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

    @acts = Act.find(params[:id])
    
  end

  # GET /acts/new
  def new
    @act = Act.new
    @invitations = Invitation.where(:specification_id => session[:specification_sel_id]).all
  end

  # GET /acts/1/edit
  def edit
	@invitations = Invitation.where(:specification_id => session[:specification_sel_id]).all
  end

  # POST /acts
  # POST /acts.json
  def create
    specification = Specification.find(session[:specification_sel_id])
	session[:specification_sel_nacional] = "Nacional"
	specification.nacional = "Nacional"
	specification.save
    @act = Act.new(act_params)
    @invt = Invitation.where(:specification_id => session[:specification_sel_id]).first
    @act.responsable = @invt.responsable
    @act.docencia = params["doc"]
    @act.investigacion = params["inv"]
    @act.extension = params["ext"]
    @act.apoyo = params["apoyoA"]
    @act.responsable = @act.responsable.upcase
    @act.justificacion = @act.justificacion.upcase
    @act.providencia = @act.providencia.upcase

    @invitations = Invitation.where(:specification_id => session[:specification_sel_id]).all
    @act.user_id = current_user.username
    @quot = Quote.where(:specification_id => session[:specification_sel_id]).first
    @quotes = Itemsquote.where(:id_oferta => @quot.id).all
    @bienSer = ""
    @quotes.each do |quot|
	@bienSer = @bienSer + quot.nombre_item + ", "
      end
    @bienSer = @bienSer[0..-3]
    @act.specification_id = session[:specification_sel_id]
    @act.bienServicio = @bienSer
    @numin = Invitation.where(:specification_id => session[:specification_sel_id], :nombre => @act.proveedor, :tipo => "Internacional").count
      if @numin != 0
	specification = Specification.find(session[:specification_sel_id])
	session[:specification_sel_nacional] = "Internacional"
	specification.nacional = "Internacional"
	specification.save
      end
    respond_to do |format|
      if @act.save
        format.html { redirect_to acts_url, notice: 'Act was successfully created.' }
        format.json { render :show, status: :created, location: @act }
      else
        format.html { render :new }
        format.json { render json: @act.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acts/1
  # PATCH/PUT /acts/1.json
  def update
    @act.update(act_params)
    @act.docencia = params["doc"]
    @act.investigacion = params["inv"]
    @act.extension = params["ext"]
    @act.apoyo = params["apoyoA"]
    @act.responsable = @act.responsable.upcase
    @act.justificacion = @act.justificacion.upcase
    @act.providencia = @act.providencia.upcase
    respond_to do |format|
      if @act.save
        format.html { redirect_to @act, notice: 'Act was successfully updated.' }
        format.json { render :show, status: :ok, location: @act }
      else
        format.html { render :edit }
        format.json { render json: @act.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acts/1
  # DELETE /acts/1.json
  def destroy
    @act.destroy
    respond_to do |format|
      format.html { redirect_to acts_url, notice: 'Act was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_act
      @act = Act.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def act_params
      params.require(:act).permit(:numRegistro, :proveedor, :bienServicio, :docencia,:investigacion,:extension,:apoyo,:responsable, :justificacion, :providencia)
    end
end
