class ActsController < ApplicationController
  layout "application_compras"
  before_action :set_act, only: [:show, :edit, :update, :destroy]

  # GET /acts
  # GET /acts.json
  def index
    if current_user
    if current_user.acquisition? || @user.import? 
    @especificacion = Specification.where(:id => session[:specification_sel_id]).first 
    @user = User.where(:username => @especificacion.user_id).first 
        if @user.director? || @user.acquisition? || @user.import? || @user.quality? || @user.manage?
            @mostrar = true
        else
            @mostrar = false
        end
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
          end
	end
      format.pdf do
		pdf = ReporteActs.new(@act)
      		  send_data pdf.render, filename: 'Especificacion_#{session[:specification_sel_id]}_Acto_Motivado.pdf', type: 'application/pdf'
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
     if current_user.acquisition? || @user.import? 
    @especificacion = Specification.where(:id => session[:specification_sel_id]).first 
    @user = User.where(:username => @especificacion.user_id).first 
        if @user.director? || @user.acquisition? || @user.import? || @user.quality? || @user.manage?
            @mostrar = true
        else
            @mostrar = false
        end
    else
    @mostrar = true
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
    respond_to do |format|
      if @act.update(act_params)
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
      params.require(:act).permit(:numRegistro, :proveedor, :bienServicio, :tesis, :responsable, :justificacion, :providencia)
    end
end
