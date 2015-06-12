class BudgetController < ApplicationController
  layout 'bootlayout'

  before_filter :authenticate_user!  
  before_action :set_subsystem 
  
  def index
  end
  
  def summary
    @labs = Lab.all
    @incomes = Income.all
    @commitments = Commitment.all

    @executions = Execution.all

    @incomes_lab = []
    @commitments_lab = []

    @executions_commitement = []

    @incomes_total = 0
    @commitments_total = 0

    @executions_total = 0

    if current_user.username == "labA"
      @labs = Lab.all.where("name=?", "A")
    elsif current_user.username == "labB"
      @labs = Lab.all.where("name=?", "B")
    elsif current_user.username == "labC"
      @labs = Lab.all.where("name=?", "C")
    elsif current_user.username == "labD"
      @labs = Lab.all.where("name=?", "D")      
    elsif current_user.username == "labE"
      @labs = Lab.all.where("name=?", "E")      
    elsif current_user.username == "labF"
      @labs = Lab.all.where("name=?", "F")      
    elsif current_user.username == "labG"
      @labs = Lab.all.where("name=? OR name=?", "G", "DirG")      
    end

    @labs.each do |l|
      @incomes_lab[l.id] = @incomes.where(lab_id: l.id).where("valid_adm=? and valid_dir=?", true, true).sum(:amount)
      @incomes_total += @incomes_lab[l.id]
      @commitments_lab[l.id] = @commitments.where(lab_id: l.id).sum(:amount)
      @commitments_total += @commitments_lab[l.id]
      @com_lab = @commitments.where(lab_id: l.id)
      @executions_commitement[l.id] = @executions.joins(commitment: :lab).where("lab_id=?", l.id).where("check_annulled=false").where("valid_adm=? and valid_dir=?", true, true).sum(:check_amount)
      @executions_total += @executions_commitement[l.id]
    end

  end

  def budget
    @labs = Lab.all

    if current_user.username == "labA"
      @labs = Lab.all.where("name=?", "A")
    elsif current_user.username == "labB"
      @labs = Lab.all.where("name=?", "B")
    elsif current_user.username == "labC"
      @labs = Lab.all.where("name=?", "C")
    elsif current_user.username == "labD"
      @labs = Lab.all.where("name=?", "D")      
    elsif current_user.username == "labE"
      @labs = Lab.all.where("name=?", "E")      
    elsif current_user.username == "labF"
      @labs = Lab.all.where("name=?", "F")      
    elsif current_user.username == "labG"
      @labs = Lab.all.where("name=? OR name=?", "G", "DirG")      
    end

    @incomes = Income.all
    @commitments = Commitment.all
    @executions = Execution.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReporteBudget.new(@labs,@incomes,@commitments,@executions)
        send_data pdf.render, filename: 'ResumenPresupuestario.pdf', type: 'application/pdf'
      end
    end    
  end
  
  private
  
  def set_subsystem
    @subsystem = 'administracion'
  end
end
