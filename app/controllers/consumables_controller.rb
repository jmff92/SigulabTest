class ConsumablesController < ApplicationController
  before_action :set_consumable, only: [:show, :edit, :update, :destroy]
  layout 'bootlayout'
  before_filter :authenticate_user!
  # GET /consumables
  # GET /consumables.json
  def index
  	if params[:search]
  		@consumables = Consumable.where(:showable => true).search(params[:search])
  		@consumables_all = Consumable.search(params[:search])
  	else
  		@consumables = Consumable.where(:showable => true).all.order('created_at DESC')
  		@consumables_all = Consumable.all.order('created_at DESC')
  	end
    @sum = Consumable.count
  end

  # GET /consumables/1
  # GET /consumables/1.json
  def show
  end

  # GET /consumables/new
  def new
    @consumable = Consumable.new
  end

  # GET /consumables/1/edit
  def edit
  end

  # POST /consumables
  # POST /consumables.json
  def create
    @consumable = Consumable.new(consumable_params)

    respond_to do |format|
      if @consumable.save
        format.html { redirect_to @consumable }
        format.json { render :show, status: :created, location: @consumable }
      else
        format.html { render :new }
        format.json { render json: @consumable.errors, status: :unprocessable_entity }
      end
    end
    @consumable.id2 = "CO-" + "#{@consumable.id}"
    @consumable.save
  end

  # PATCH/PUT /consumables/1
  # PATCH/PUT /consumables/1.json
  def update
    respond_to do |format|
      if @consumable.update(consumable_params)
        format.html { redirect_to @consumable }
        format.json { render :show, status: :ok, location: @consumable }
      else
        format.html { render :edit }
        format.json { render json: @consumable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consumables/1
  # DELETE /consumables/1.json
  def destroy
    @consumable.destroy
    respond_to do |format|
      format.html { redirect_to consumables_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consumable
      @consumable = Consumable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consumable_params
      params.require(:consumable).permit(:name, :description, :material, :quantity, :location, :responsible, :investigation, :teaching, :extention, :management, :cost, :bill, :buy_order, :adquisition_date, :showable, :dependency, :correo, :numDonacion, :fechaDonacion, :pJDonacion, :personaContactoDonacion, :origen)
    end
end
