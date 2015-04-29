class LabsController < ApplicationController
  def show
  	@lab = Lab.find(params[:id])
    @incomes_total = Income.all.where(lab_id: @lab.id).sum(:amount) 
    @commitments_total = Commitment.all.where(lab_id: @lab.id).sum(:amount)  
    @executions_total = Execution.joins(commitment: :lab).where("lab_id=?", params[:id]).where("check_annulled=false").sum(:check_amount)    
  end
end
