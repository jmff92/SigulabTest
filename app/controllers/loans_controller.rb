class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :edit, :update, :destroy, :item_ids]
  layout 'bootlayout'
  before_filter :authenticate_user!
  # GET /loans
  # GET /loans.json
  def index
    @loans = Loan.all
    @sumSolicitudes = Loan.all.count
  end

  # GET /loans/1
  # GET /loans/1.json
  def show
    @id = params[:id]
    @loan = Loan.find(params[:id])
    @relation_loan = RelationLoan.select(:item).where(prestamo: @loan.id.to_s)
    @equipment = Equipment.where(id2: @relation_loan)
    @instruments = Instrument.where(id2: @relation_loan)
    @tools = Tool.where(id2: @relation_loan)
    @consumables = Consumable.where(id2: @relation_loan)
    @sustancias = ChemicalSubstance.where(id2: @relation_loan)

    respond_to do |format|
      format.html
      format.pdf do
        pdf = SolicitudPrestamo.new(@loan)
        send_data pdf.render, filename: 'SolicitudPrestamo.pdf', type: 'application/pdf'
      end
    end
  end

  # GET /loans/new
  def new
    if params[:item_ids] == nil
      flash[:notice] = "No ha seleccionado ningun item para ser prestado"
      redirect_to :back
    else
      if params[:commit]
        redirect_to :controller => "applications", :action => "new", :item_ids => params[:item_ids]
      else
        @loan = Loan.new
        @equipment = Equipment.where(id2: params[:item_ids])
        @instruments = Instrument.where(id2: params[:item_ids])
        @tools = Tool.where(id2: params[:item_ids])
        @consumables = Consumable.where(id2: params[:item_ids])
        @sustancias = ChemicalSubstance.where(id2: params[:item_ids])

        @sumE = Equipment.where(id2: params[:item_ids]).count
        @sumI = Instrument.where(id2: params[:item_ids]).count
        @sumT = Tool.where(id2: params[:item_ids]).count
        @sumC = Consumable.where(id2: params[:item_ids]).count
        @sumS = ChemicalSubstance.where(id2: params[:item_ids]).count
        @id = params[:item_ids]
      end
    end
  end

  # GET /loans/1/edit
  def edit
  end

  # POST /loans
  # POST /loans.json
  def create
    @ids = params[:item_ids].split(" ")
    @loan = Loan.new(loan_params)
    @equipment = Equipment.where(id2: @ids)
    @instruments = Instrument.where(id2: @ids)
    @tools = Tool.where(id2: @ids)
    @consumables = Consumable.where(id2: @ids)
    @sustancias = ChemicalSubstance.where(id2: @ids)
    
    respond_to do |format|
      if @loan.save

        @equipment.each do |equipment|
          @relation_loan = RelationLoan.new
          @relation_loan.prestamo = @loan.id.to_s
          @relation_loan.item = equipment.id2
          @relation_loan.save
        end

        @instruments.each do |instrument|
          @relation_loan = RelationLoan.new
          @relation_loan.prestamo = @loan.id.to_s
          @relation_loan.item = instrument.id2
          @relation_loan.save
        end

        @tools.each do |tool|
          @relation_loan = RelationLoan.new
          @relation_loan.prestamo = @loan.id.to_s
          @relation_loan.item = tool.id2
          @relation_loan.save
        end

        @consumables.each do |consumable|
          @relation_loan = RelationLoan.new
          @relation_loan.prestamo = @loan.id.to_s
          @relation_loan.item = consumable.id2
          @relation_loan.save
        end

        @sustancias.each do |sustancia|
          @relation_loan = RelationLoan.new
          @relation_loan.prestamo = @loan.id.to_s
          @relation_loan.item = sustancia.id2
          @relation_loan.save
        end

        format.html { redirect_to @loan, :item_ids => params[:item_ids] }
        format.json { render :show, status: :created, location: @loan }
      else
        format.html { render :new }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loans/1
  # PATCH/PUT /loans/1.json
  def update
    respond_to do |format|
      if @loan.update(loan_params)
        format.html { redirect_to @loan }
        format.json { render :show, status: :ok, location: @loan }
      else
        format.html { render :edit }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1
  # DELETE /loans/1.json
  def destroy
    @loan.destroy
    respond_to do |format|
      format.html { redirect_to loans_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_params
      params.require(:loan).permit(:fechaEntrega, :ubicacion, :fechaTope, :condiciones, :medida)
    end
end
