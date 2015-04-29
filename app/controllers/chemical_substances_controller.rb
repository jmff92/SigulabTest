class ChemicalSubstancesController < ApplicationController
  before_action :set_chemical_substance, only: [:show, :edit, :update, :destroy, :search, :hide]
  layout 'bootlayout'
  before_filter :authenticate_user!
  # GET /chemical_substances
  # GET /chemical_substances.json
  def index
  	if params[:search]
  		@chemical_substances = ChemicalSubstance.where(:showable => true).search(params[:search])
   		@chemical_substances_all=ChemicalSubstance.search(params[:search],params[:column])
  	else
  		@chemical_substances = ChemicalSubstance.where(:showable => true).order('created_at DESC')
   		@chemical_substances_all=ChemicalSubstance.all.order('created_at DESC')
  	end
    @sum = ChemicalSubstance.count
    @items = params[:item_ids]
  end

  # GET /chemical_substances/1
  # GET /chemical_substances/1.json
  def show
    @ids = @chemical_substance.id2
  end

  # GET /chemical_substances/new
  def new
    @chemical_substance = ChemicalSubstance.new
  end

  # GET /chemical_substances/1/edit
  def edit
  end

  # POST /chemical_substances
  # POST /chemical_substances.json
  def create
    @chemical_substance = ChemicalSubstance.new(chemical_substance_params)
    respond_to do |format|
      if @chemical_substance.save
        format.html { redirect_to @chemical_substance }
        format.json { render :show, status: :created, location: @chemical_substance }
      else
        format.html { render :new }
        format.json { render json: @chemical_substance.errors, status: :unprocessable_entity }
      end
    end
    @chemical_substance.id2 = "SQ-" + "#{@chemical_substance.id}"
    @chemical_substance.save
    @binnacle = Binnacle.new
    @binnacle.idSustancia = @chemical_substance.id2
    @binnacle.fecha = Date.today
    @binnacle.consumo = 0.0
    @binnacle.ingreso = @chemical_substance.quantity
    @binnacle.total = @chemical_substance.quantity
    @binnacle.tipo = "Ingreso"
    @binnacle.descripcion = " "
    @binnacle.save
  end

  # PATCH/PUT /chemical_substances/1
  # PATCH/PUT /chemical_substances/1.json
  def update
    respond_to do |format|
      if @chemical_substance.update(chemical_substance_params)
        format.html { redirect_to @chemical_substance }
        format.json { render :show, status: :ok, location: @chemical_substance }
      else
        format.html { render :edit }
        format.json { render json: @chemical_substance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chemical_substances/1
  # DELETE /chemical_substances/1.json
  def destroy
    @chemical_substance.destroy
    respond_to do |format|
      format.html { redirect_to chemical_substances_url }
      format.json { head :no_content }
    end
  end
  
  def hide
    @chemical_substance.hide
    respond_to do |format|
      format.html { redirect_to chemical_substances_url }
      format.json { head :no_content }
	  end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chemical_substance
      @chemical_substance = ChemicalSubstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chemical_substance_params
      params.require(:chemical_substance).permit(:name, :purity, :matter_states, :controlled, :quantity, :cas, :meassure, :status, :responsible, :location, :expiration_date, :rI7, :rI4, :toxic, :oxidant, :explosive, :irritating, :inflamable, :corrosive, :nocive, :investigation, :teaching, :extention, :cost, :bill, :buy_order, :adquisition_date, :showable, :dependency)
    end
end
