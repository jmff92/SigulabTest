class ProjpaymentauthsController < ApplicationController
  layout 'bootlayout'

  before_filter :authenticate_user!
  
  def index
    @project = Project.find(params[:id])
    @pays = Projpaymentauth.all.order("elaboration_date ASC").where("proyect=?",params[:id])
  end

  def show
    @pay = Projpaymentauth.find(params[:id])
    @project = Project.find(@pay.proyect)    
    respond_to do |format|
      format.html
      format.pdf do
        pdf = AutorizacionPago.new(@pay)
        send_data pdf.render, filename: 'AutorizacionPago.pdf', type: 'application/pdf'
      end
    end
  end

  def all
    @pays = Projpaymentauth.all.order("elaboration_date ASC")
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
    
    if @pay.update_attributes(projpaymentauth_params)
      # Si cambio fecha de recepcion (nil a fecha), se genera compromiso
        if (@old_date == nil) and (@new_date != "")
        @commitment = Projcommitment.new
        @commitment.id = Projcommitment.last.id+1
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
    @pay = Projpaymentauth.find params[:id]
   @pay.destroy
    redirect_to action: 'index'
  end  
  
  private
  
    def projpaymentauth_params
      params.require(:projpaymentauth).permit(:registry, :recipient, :from, :elaboration_date, :delivery_date, :delivered_id, :concept, :amount, :observations, :recieved_by, :is_valid)
    end
  
end
