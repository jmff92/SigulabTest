class StaticsController < ApplicationController
   layout "appindex"
   before_filter :authenticate_user!

	def index
    	if current_user.manage?
      	@incomes = Income.all.order("date ASC").where("valid_adm=?", false)
      	@executions = Execution.all.order("date ASC").where("valid_adm=?", false)
      	@projects = {}
      	@projcommitments = {}
      	@projexecutions = {}
        @notifications = @incomes.count + @executions.count + @projects.count + @projcommitments.count + @projexecutions.count
    	elsif current_user.director?
      	@incomes = Income.all.order("date ASC").where("valid_adm=? AND valid_dir=?", true, false)
      	@executions = Execution.all.order("date ASC").where("valid_adm=? AND valid_dir=?", true, false)
      	@projects = {}
      	@projcommitments = {}
      	@projexecutions = {}
        @notifications = @incomes.count + @executions.count + @projects.count + @projcommitments.count + @projexecutions.count
    	elsif current_user.proy_responsible?
      	@incomes = {}
      	@executions = {}
      	@projects = Project.all
      	@projcommitments = Projcommitment.all
      	@projexecutions = Projexecution.all	
        @notifications = @incomes.count + @executions.count + @projects.count + @projcommitments.count + @projexecutions.count
      else
        @notifications = 0
      end
	end

end
