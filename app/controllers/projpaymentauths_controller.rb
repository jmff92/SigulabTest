class ProjpaymentauthsController < ApplicationController
  layout 'bootlayout'

  before_filter :authenticate_user!
  
  def index
    @project = Project.find(params[:id])
    @pays = ((Projpaymentauth.all.order("elaboration_date ASC").where("proyect=? and valid_adm=?",params[:id], true)) + (Projpaymentauth.all.where("user_id=? and proyect=?", current_user.id, params[:id]))).uniq.sort_by(&:"#{"elaboration_date"}")
  end

  def show
    @pay = Projpaymentauth.find(params[:id])    
    @status = @pay.status
    @project = Project.find(@pay.proyect)    
    respond_to do |format|
      format.html
      format.pdf do
        pdf = AutorizacionPagoProj.new(@pay)
        send_data pdf.render, filename: 'AutorizacionPago.pdf', type: 'application/pdf'
      end
    end
  end

  def all
    @pays = ((Projpaymentauth.all.order("elaboration_date ASC").where("valid_adm=?", true)) + (Projpaymentauth.all.where("user_id=? and proyect=?", current_user.id, params[:id]))).uniq.sort_by(&:"#{"elaboration_date"}")
    @sum = @pays.sum(:amount)
  end
  
  def new
    @pay = Projpaymentauth.new
    if params[:id]
       @project = Project.find(params[:id])
       @pay.proyect = params[:id]
    end
  end
  
  def create
    # Check Date
    unless params[:projpaymentauth].nil?
      begin
        params[:projpaymentauth][:elaboration_date] = Date.parse(params[:projpaymentauth][:elaboration_date])
      rescue ArgumentError
        params[:projpaymentauth][:elaboration_date] = nil
      end
    end
    
    @pay = Projpaymentauth.new(projpaymentauth_params)
    @pay.proyect = params[:id]
    @pay.from = @pay.from.upcase
    @pay.recipient = @pay.recipient.upcase
    @pay.concept = @pay.concept.upcase
    @pay.observations = @pay.observations.upcase
    if !@pay.recieved_by.nil?
      @pay.recieved_by = @pay.recieved_by.upcase
    end
    if @pay.save
						redirect_to controller: 'projpaymentauths', id: params[:id]
    else
      render 'new'
    end
  end
  
  def edit
    @pay = Projpaymentauth.find(params[:id])
    @project = Project.find(@pay.proyect)
  end
  
  def update
    @pay = Projpaymentauth.find(params[:id])
    @old_date = @pay.delivery_date
    @new_date = projpaymentauth_params[:delivery_date]

    params[:projpaymentauth][:from] = params[:projpaymentauth][:from].upcase
    params[:projpaymentauth][:recipient] = params[:projpaymentauth][:recipient].upcase
    params[:projpaymentauth][:concept] = params[:projpaymentauth][:concept].upcase
    params[:projpaymentauth][:observations] = params[:projpaymentauth][:observations].upcase
    if !params[:projpaymentauth][:recieved_by].nil?
      params[:projpaymentauth][:recieved_by] = params[:projpaymentauth][:recieved_by].upcase
    end

    if @pay.update_attributes(projpaymentauth_params)
      # Si cambio fecha de recepcion (nil a fecha), se genera compromiso
        if (@old_date == nil) and (@new_date != "")
        @commitment = Projcommitment.new
        if Projcommitment.count > 0
          @commitment.id = Projcommitment.last.id+1
        else
          @commitment.id = 1
        end
        @commitment.proj_id = @pay.proyect
        @commitment.code = @pay.registry
        @commitment.amount = @pay.amount
        @commitment.description = @pay.concept
        @commitment.recipient = @pay.recipient
        @commitment.date = @pay.elaboration_date
        @commitment.observations = @pay.observations
        @commitment.document = 2
        @commitment.created_at = @pay.created_at
        @commitment.updated_at = @pay.updated_at
        @commitment.save      
      end
      redirect_to projpaymentauth_url(@pay)
    else
      render 'edit'
    end
  end

  def annul
    @pay = Projpaymentauth.find(params[:id])
    @pay.update_column(:status, "annulled")
    redirect_to :back
  end  

  def delete
    @proy = Projpaymentauth.find(params[:id]).proyect 
    @pay = Projpaymentauth.find(params[:id]).destroy
    redirect_to action: 'index', id: @proy
  end  

  def validating
    @pay = Projpaymentauth.find(params[:id])
    @pay.update_column(:status, "validating")
    @pay.update_column(:valid_adm, false)    
    redirect_to :back
  end   

  def valid_projadmin
    @pay = Projpaymentauth.find(params[:id])
    @pay.update_column(:valid_adm, true)
    @pay.update_column(:status, "generated")    
    redirect_to :back
  end  

  def del
    @pay = Projpaymentauth.find(params[:id])
    @pay.update_column(:status, nil)
    @pay.update_column(:valid_adm, false)
    redirect_to :back    
  end   

  
  private
  
    def projpaymentauth_params
      params.require(:projpaymentauth).permit(:registry, :recipient, :from, :elaboration_date, :delivery_date, :delivered_id, :concept, :amount, :observations, :recieved_by, :valid_adm, :user_id)
    end
  
end
