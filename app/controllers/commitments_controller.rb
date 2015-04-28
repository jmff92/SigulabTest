class CommitmentsController < ApplicationController
  layout 'bootlayout'

  before_filter :authenticate_user!
  
  def index
    @commitments = Commitment.all.order("date ASC")
    @sum = @commitments.sum(:amount)
  end

  def list_lab
    @lab = Lab.find(params[:id])
    @commitments = Commitment.all.order("date ASC").where("lab_id=?", params[:id])
    @sum = @commitments.sum(:amount)
  end

  def show
    @commitment = Commitment.find(params[:id])
    @executions = Execution.where("commitment_id=?",params[:id])
    @sum = @executions.where("check_annulled=false").sum(:check_amount)
    @dif = @commitment.amount - @sum
    @size = @executions.count
  end
  
  def new
    @commitment = Commitment.new
    @labs = Lab.all
  end
  
  def create
    # Check Date
    unless params[:commitment].nil?
      begin
        params[:commitment][:date] = Date.parse(params[:commitment][:date])
      rescue ArgumentError
        params[:commitment][:date] = nil
      end
    end
    
    @commitment = Commitment.new(commitment_params)
    
    if @commitment.save
      redirect_to action: 'index'
    else
      @labs = Lab.all
      render 'new'
    end
  end
  
  def edit
    @commitment = Commitment.find(params[:id])
    @labs = Lab.all
  end
  
  def update
    # Check Date
    unless params[:commitment].nil?
      begin
        params[:commitment][:date] = Date.parse(params[:commitment][:date])
      rescue ArgumentError
        params[:commitment][:date] = nil
      end
    end
    
    @commitment = Commitment.find(params[:id])
    
    if @commitment.update_attributes(commitment_params)
      redirect_to action: 'index'
    else
      @labs = Lab.all
      render 'edit'
    end
  end
  
  private
  
    def commitment_params
      params.require(:commitment).permit(:lab_id, :sae_code, :recipient, :amount, :description, :date, :code, :observations, :document)
    end
  
end
