class ExecutionsController < ApplicationController
  layout 'bootlayout'

  before_filter :authenticate_user!

  def index
    @executions = Execution.all.where("valid_adm=? AND valid_dir=?", true, true)
    @sum = @executions.where("check_annulled=false").sum(:check_amount)
  end

  def list_lab
    @lab = Lab.find(params[:id])
    @executions = Execution.joins(commitment: :lab).where("lab_id=?", params[:id]).where("valid_adm=? AND valid_dir=?", true, true)
    @sum = @executions.where("check_annulled=false").sum(:check_amount)
  end

  def show
    @execution = Execution.find(params[:id])
    @executions = Execution.where("commitment_id=?",params[:cid]).where("valid_adm=? AND valid_dir=?", true, true)
    @sum = @executions.where("check_annulled=false").sum(:check_amount)
  end

  def list
    @executions = Execution.where("commitment_id=?",params[:cid]).where("valid_adm=? AND valid_dir=?", true, true)
    @sum = @executions.where("check_annulled=false").sum(:check_amount)
    @commitments = Commitment.find(params[:cid])
    @sum_commitment = @commitments.amount
  end
  
  def new
    @execution = Execution.new
    if params[:cid]
      @commitment = Commitment.find(params[:cid])
      @execution.commitment_id = params[:cid]
      @executed = Execution.where("commitment_id=?",params[:cid]).where("check_annulled=false").sum(:check_amount).where("valid_adm=? AND valid_dir=?", true, false)
    end
  end
  
  def create
    # Check Date
    unless params[:execution].nil?
      begin
        params[:execution][:check_elaboration_date] = Date.parse(params[:execution][:check_elaboration_date])
      rescue ArgumentError
        params[:execution][:check_elaboration_date] = nil
      end
    end
    
    @execution = Execution.new(execution_params)

    @commitment = Commitment.find(params[:cid])    
    @executions = Execution.where("commitment_id=?",params[:cid])
    @executed = @executions.where("check_annulled=false").sum(:check_amount)
    if !@execution.check_amount.blank?
      if @execution.check_amount > @commitment.amount - @executed
        @execution.executable_amount
        render 'new'
      else 
        if @execution.save
          redirect_to action: 'index'
        else
          render 'new'        
        end
      end
    else
      if @execution.save
        redirect_to action: 'index'
      else
        render 'new'        
      end   
    end   
  end
  
  def edit
    @execution = Execution.find(params[:id])
    @commitment = Commitment.find(Execution.find(params[:id]).commitment_id) 
  end
  
  def update
    # Check Date
    unless params[:execution].nil?
      if !params[:execution][:check_elaboration_date].nil?
        begin
          params[:execution][:check_elaboration_date] = Date.parse(params[:execution][:check_elaboration_date])
        rescue ArgumentError
          params[:execution][:check_elaboration_date] = nil
        end
      end
    end

    @execution = Execution.find(params[:id])
    @commitment = Commitment.find(Execution.find(params[:id]).commitment_id)    

    @oldamount = @execution.check_amount    
    @executions = Execution.where("commitment_id=?",@execution.commitment_id).where("valid_adm=? AND valid_dir=?", true, false)
    @executed = @executions.where("check_annulled=false").sum(:check_amount) - @oldamount

    if params[:execution][:check_amount].to_i > @commitment.amount - @executed
      @execution.executable_amount
      render 'edit'
    else 
      if @execution.update_attributes(execution_params)
        redirect_to action: 'index'
      else
        @commitment = Commitment.find(Execution.find(params[:id]).commitment_id)
        render 'edit'
      end
    end    
  end

  def annul
    @execution = Execution.find(params[:id])
    @execution.update_attribute(:check_annulled, true)
    redirect_to :back
  end

  def delete
    @execution = Execution.find params[:id]
    @execution.destroy
    redirect_to :back    
  end      

  def valid_adm
    @execution = Execution.find(params[:id])
    @execution.update_attribute(:valid_adm, true)
    redirect_to :back
  end  

  def valid_dir
    @execution = Execution.find(params[:id])
    @execution.update_attribute(:valid_dir, true)
    redirect_to :back
  end    
  
  private
  
    def execution_params
      params.require(:execution).permit(:code, :commitment_id, :check_amount, :check_number, :check_elaboration_date, :document, :document_name, :check_sign_date, :check_delivery_date, :remarks, :document_date, :invoice_number, :invoice_date, :valid_adm, :valid_dir)
    end
    
    def purge_date(date)
      return date if date.blank?
      begin
        date = Date.parse(date)
      rescue ArgumentError
        return nil
      end
      return date
    end
  
end
