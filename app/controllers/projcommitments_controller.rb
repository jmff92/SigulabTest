class ProjcommitmentsController < ApplicationController
  layout 'bootlayout'

  before_filter :authenticate_user!
  
  def index
    if params[:id]
      @project = Project.find(params[:id])
    end       
    @commitments = Projcommitment.order("date ASC").where("proj_id=?",params[:id]).where("valid_res=?", true)
    @sum = @commitments.sum(:amount)
    @suma = Projcommitment.all
  end

  def all
    @projcommitments = Projcommitment.all.order("date ASC").where("valid_res=?", true)
    @sum = @projcommitments.sum(:amount)
  end

  def show
    @commitment = Projcommitment.find(params[:id])
    @executions = Projexecution.all.where("commitment_id=?",params[:id]).where("valid_res=?", true)
    @sum = @executions.where("check_annulled=false").sum(:check_amount)
    @dif = @commitment.amount - @sum
    @size = @executions.count
    @project = Project.all.find(@commitment.proj_id)
  end

  def new
    @commitment = Projcommitment.new
    if params[:id]
      @project = Project.find(params[:id])
      @commitment.proj_id = params[:id]
    end
  end  

  def create
    # Check Date
    unless params[:projcommitment].nil?
      begin
        params[:projcommitment][:date] = Date.parse(params[:projcommitment][:date])
      rescue ArgumentError
        params[:projcommitment][:date] = nil
      end
    end
    
    
    @commitment = Projcommitment.new(projcommitment_params)
    @commitment.proj_id = params[:id]
    @commitment.description = @commitment.description.upcase
    @commitment.recipient = @commitment.recipient.upcase
    @commitment.observations = @commitment.observations.upcase

    @commitment.id = Projcommitment.count + 1

    if @commitment.save
      redirect_to controller: 'projcommitments', id: params[:id]
    else
      render 'new'
    end
  end

  def edit
    @commitment = Projcommitment.find(params[:id])
    @project = Project.find(@commitment.proj_id)
  end

  def update
    # Check Date
    unless params[:projcommitment].nil?
      begin
        params[:projcommitment][:date] = Date.parse(params[:projcommitment][:date])
      rescue ArgumentError
        params[:projcommitment][:date] = nil
      end
    end
    
    @commitment = Projcommitment.find(params[:id])
    params[:commitment][:description] = params[:commitment][:description].upcase
    params[:commitment][:observations] = params[:commitment][:observations].upcase
    params[:commitment][:recipient] = params[:commitment][:recipient].upcase
    
    if @commitment.update_attributes(projcommitment_params)
      redirect_to projcommitment_url(@commitment)
    else
      render 'edit'
    end
  end  

  def valid
    @projcommitment = Projcommitment.find(params[:id])
    @projcommitment.update_column(:valid_res, true)
    redirect_to :back
  end     

  def delete
    @projcommitment = Projcommitment.find params[:id]
    @projcommitment.destroy
    redirect_to :back    
  end    

  private
  
    def projcommitment_params
      params.require(:projcommitment).permit(:proj_id, :recipient, :amount, :description, :date, :code, :observations, :document, :valid)
    end
  
end  
