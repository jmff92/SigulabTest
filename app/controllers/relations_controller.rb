class RelationsController < ApplicationController
  layout "application_compras"
  respond_to :html, :xml, :json
  before_action :set_relation, only: [:show, :edit, :update, :destroy]

  # GET /invitations
  # GET /invitations.json
  def index
    if current_user
    	@relations = Relation.where(:specification_id => session[:specification_sel_id]).all
      @sumRelation = Relation.where(:specification_id => session[:specification_sel_id]).count
      @items = Item.where(:specification_id => session[:specification_sel_id]).all
    end
  end

  # GET /invitations/1
  # GET /invitations/1.json
  def show
    @relation = Relation.find(params[:id])
    @item = Item.where(:id => @relation.item_id).first
    tipo = ""
	if @relation.equipo == "1"
		tipo = tipo + ", Equipo"
	end
	if @relation.material_consumible == "1"
		tipo = tipo + ", Material consumible"
	end
	if @relation.servicio == "1"
		tipo = tipo + ", Servicio"
	end
	if @relation.licencia == "1"
		tipo = tipo + ", Licencia"
	end
	if @relation.repuesto == "1"
		tipo = tipo + ", Repuesto"
	end
	if @relation.renovacion_licencia == "1"
		tipo = tipo + ", Renovacion licencia"
	end
	if @relation.accesorio == "1"
		tipo = tipo + ", Accesorio"
	end
	if @relation.otro == "1"
		tipo = tipo + ", Otro"
	end
	if tipo != ""
		tipo = tipo[1..-1]
	end
	@tipo = tipo
    respond_to do |format|
      format.html
      format.pdf do
	specif = Specification.find(session[:specification_sel_id])
	@item = Item.find(@relation.item_id)
	inombre = @item.nombre
        pdf = ReporteRelations.new(@relation,specif,@item,tipo)
	
        nombre = "Especificacion_#{session[:specification_sel_id]}_Relacion_Descriptiva_Item_#{inombre}.pdf"
        send_data pdf.render, filename: nombre, type: 'application/pdf'
      end
    end
  end


  # GET /invitations/new
  def new
    @relation = Relation.new
    @items = Item.where(:specification_id => session[:specification_sel_id], :comprar => 1).all
  end

  # GET /invitations/1/edit
  def edit
    @items = Item.where(:specification_id => session[:specification_sel_id], :comprar => 1).all
  end

  # POST /invitations
  # POST /invitations.json
  def create
    @relation = Relation.new(relation_params)
    @relation.specification_id = session[:specification_sel_id]
    @items = Item.where(:specification_id => session[:specification_sel_id]).all
    @itemsc = Item.where(:specification_id => session[:specification_sel_id]).count
    
    
    respond_to do |format|
      if @relation.save
       @sumRelation = Relation.where(:specification_id => session[:specification_sel_id]).count
        if @itemsc == @sumRelation
		specification = Specification.find(session[:specification_sel_id])
	   
	       specification.p8 = 2
		specification.p9 = 1
	    session[:specification_p8] = specification.p8
	    session[:specification_p9] = specification.p9
	    specification.save
	end
        format.html { redirect_to relations_url, notice: 'Invitation was successfully created.' }
        format.json { render :show, status: :created, location: @relation }
      else
        format.html { render :new }
        format.json { render json: @relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invitations/1
  # PATCH/PUT /invitations/1.json
  def update
    
    respond_to do |format|
      if @relation.update(relation_params)
        format.html { redirect_to @relation, notice: 'Invitation was successfully updated.' }
        format.json { render :show, status: :ok, location: @relation }
      else
        format.html { render :edit }
        format.json { render json: @relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invitations/1
  # DELETE /invitations/1.json
  def destroy
    @relation.destroy
    respond_to do |format|
      format.html { redirect_to relations_url, notice: 'Invitation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relation
      @relation = Relation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relation_params
      params.require(:relation).permit(:marca,:modelo, :descripcion_general, :item_id, :materia, :funcion, :ubicacion, :aplicacion, :observaciones, :equipo, :material_consumible, :servicio, :licencia, :repuesto, :renovacion_licencia, :accesorio, :otro, :alto, :ancho, :largo, :peso, :dimensiones_alto, :dimensiones_ancho, :dimensiones_largo, :dimensiones_peso)
    end
end
