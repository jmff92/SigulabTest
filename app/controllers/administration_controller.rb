class AdministrationController < ApplicationController
  layout 'bootlayout'
  
  before_filter :authenticate_user!
  before_action :set_subsystem 
  
  def index
  end

  def notifications
      @incomes = {}
      @executions = {}
      @pays = {}
      @projects = {}
      @projcommitments = {}
      @projexecutions = {}
      @poas = {}
      @apays = {}  
    if current_user.manage?
      @incomes = Income.all.order("date ASC").where("valid_adm=?", false)
      @executions = Execution.all.order("check_elaboration_date ASC").where("valid_adm=?", false)
      @pays = Paymentauth.joins(:user).where("manage_analist=?", true).where("valid_coord=? AND status=?", false, "validating").order("elaboration_date ASC")
    end
    if current_user.director?
      @incomes = Income.all.order("date ASC").where("valid_adm=? AND valid_dir=?", true, false)
      @executions = Execution.all.order("check_elaboration_date ASC").where("valid_adm=? AND valid_dir=?", true, false)
      @poas = Poa.all.order("year ASC").where("del=?", true)
      @pays = Paymentauth.all.order("elaboration_date ASC").where("valid_coord=? AND valid_dir=?", true, false)
      @apays = Paymentauth.all.order("elaboration_date ASC").where("annull=?", true)
    end
    if current_user.proy_responsible?
      @projects = Project.all.order("incoming_date ASC").where("valid_res=?", false)
      @projcommitments = Projcommitment.all.order("date ASC").where("valid_res=?", false)
      @projexecutions = Projexecution.all.order("check_elaboration_date ASC").where("valid_res=?", false)
    end
    if current_user.acquisition?
      @pays = Paymentauth.joins(:user).where("acquisition_analist=?", true).where("valid_coord=?", false).order("elaboration_date ASC")
    end
    if current_user.import?
      @pays = Paymentauth.joins(:user).where("import_analist=?", true).where("valid_coord=?", false).order("elaboration_date ASC")
    end
    if current_user.quality?
      @pays = Paymentauth.joins(:user).where("quality_analist=?", true).where("valid_coord=?", false).order("elaboration_date ASC")
    end
    if current_user.labBoss?
      @pays = Paymentauth.joins(:user).where("labassistant=?", true).where("valid_coord=?", false).order("elaboration_date ASC")         
    end
    @notifications = @incomes.count + @executions.count + @projects.count + @projcommitments.count + @projexecutions.count + @poas.count + @pays.count + @apays.count 
    closeNotif(@notifications)
  end

  private
  def closeNotif(notif)
    if notif==0
      redirect_to administration_url
    end
  end
  
  def set_subsystem
    @subsystem = 'administracion'
  end
  
end
