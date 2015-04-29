class AdministrationController < ApplicationController
  layout 'bootlayout'
  
  before_filter :authenticate_user!
  before_action :set_subsystem 
  
  def index
  end

  def notifications
    if current_user.manage?
      @incomes = Income.all.order("date ASC").where("valid_adm=?", false)
      @executions = Execution.all.order("date ASC").where("valid_adm=?", false)
      @projects = {}
      @projcommitments = {}
      @projexecutions = {}
    end
    if current_user.director?
      @incomes = Income.all.order("date ASC").where("valid_adm=? AND valid_dir=?", true, false)
      @executions = Execution.all.order("date ASC").where("valid_adm=? AND valid_dir=?", true, false)
      @projects = {}
      @projcommitments = {}
      @projexecutions = {}      
    end
    if current_user.proy_responsible?
      @incomes = {}
      @executions = {}
      @projects = Project.all.order("incoming_date ASC").where("valid_res=?", false)
      @projcommitments = Projcommitment.all.order("date ASC").where("valid_res=?", false)
      @projexecutions = Projexecution.all.order("date ASC").where("valid_res=?", false)
    end
  end

  private
  
  def set_subsystem
    @subsystem = 'administracion'
  end
  
end
