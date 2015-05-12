class ProjectsController < ApplicationController
  layout 'bootlayout'

  before_filter :authenticate_user!

  def index
  end

  def new
  	@project = Project.new
  end

  def create
    # Check Date
    unless params[:project].nil?
      begin
        params[:project][:incoming_date] = Date.parse(params[:project][:incoming_date])
      rescue ArgumentError
        params[:project][:incoming_date] = nil
      end
    end

    # Default status depending on incoming_date
    if params[:project][:incoming_date].nil?
      params[:project][:status] = 0
    else
      params[:project][:status] = 1
    end      
    
    @project = Project.new(project_params)
    if @project.save
#      redirect_to action: 'index'
		redirect_to projects_path, notice: "The document has been uploaded."
    else
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
    @incomes_total = Projincome.all.where(proyecto: @project.id).sum(:amount) 
    @commitments_total = Projcommitment.all.where(proj_id: @project.id).where("valid_res=?", true).sum(:amount)
    @executions_total = Projexecution.all.where(proyecto: @project.id).where("check_annulled=false").where("valid_res=?", true).sum(:check_amount)    
  end    

    def edit

      @project = Project.find(params[:id])

    end
    
    def update

      # Check Date
      unless params[:project].nil?
        begin
           
          if (params[:project][:incoming_date] == nil)
            @project_anulled = Project.find(params[:id])            
            params[:project][:incoming_date] = @project_anulled.incoming_date
          else
            params[:project][:incoming_date] = Date.parse(params[:project][:incoming_date])
          end
        rescue ArgumentError
          params[:project][:incoming_date] = nil
        end
      end

      @project = Project.find(params[:id])

      if params[:project][:incoming_date].nil? && (not (params[:project][:status] == "pending"))      
        @project.incoming_date_required
        render 'edit'
      else 
          if params[:project][:annulled_date] == "" && params[:project][:status] == "annulled"
            params[:project][:annulled_date] = nil
            @project.annulled_date_required
            render 'edit'
          else
            if @project.update_attributes(project_params)
              redirect_to project_url(@project)
            else
              render 'edit'
            end
          end
        end
      end

def list
  @projects = Project.all.order("project_number ASC").where("valid_res=?", true)
  @sum = @projects.where("NOT(status=3) AND NOT(status=4)").sum(:amount)  
end

def admin
  @projects = Project.all.order("project_number ASC").where("valid_res=?", true)

  @incomes = Projincome.all
  @commitments = Projcommitment.all.where("valid_res=?", true)
  @executions = Projexecution.all.where("valid_res=?", true)

  @incomes_proj = []
  @commitments_proj = []

  @executions_commitement = []
  @incomes_total = 0
  @commitments_total = 0

  @executions_total = 0


  @projects.each do |p|
    @incomes_proj[p.id] = @incomes.where(proyecto: p.id).sum(:amount)
    @incomes_total += @incomes_proj[p.id]
    @commitments_proj[p.id] = @commitments.where(proj_id: p.id).sum(:amount)
    @commitments_total += @commitments_proj[p.id]
    @executions_commitement[p.id] = @executions.where(proyecto: p.id).where("check_annulled=false").sum(:check_amount)
    @executions_total += @executions_commitement[p.id]
  end

  respond_to do |format|
    format.html
    format.pdf do
      pdf = ReporteProjects.new(@projects, @incomes, @commitments, @executions)
      send_data pdf.render, filename: 'ResumenPresupuestarioProyectos.pdf', type: 'application/pdf'
    end
  end
end

def summary
  @project = Project.find(params[:id]) 
  @incomes_total = Projincome.all.where(proyecto: @project.id).sum(:amount) 
  @commitments_total = Projcommitment.all.where(proj_id: @project.id).where("valid_res=?", true).sum(:amount)  
  @executions_total = Projexecution.all.where(proyecto: @project.id).where("check_annulled=false").where("valid_res=?", true).sum(:check_amount)
end

  def valid_resp
    @project = Project.find(params[:id])
    @project.update_column(:valid_res, true)
    redirect_to :back
  end  

  def delete
    @project = Project.find params[:id]
    @project.destroy
    redirect_to :back    
  end      


  private
  
    def project_params
      params.require(:project).permit(:project_number, :contract, :title, :responsible, 
      	                              :admin, :sae_code, :amount, :equipments, :services, 
      	                              :infrastructure, :hhrr, :consumables, :furniture, 
                                      :incoming_date, :status, :other_desc, :other_amount, 
                                      :annulled_date, :observation, :num_cuenta, :banco, :substitute, :observation, :valid)
    end

end
