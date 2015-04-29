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
    # Check Date
    unless params[:paymentauth].nil?
      begin
        params[:projpaymentauth][:elaboration_date] = Date.parse(params[:projaymentauth][:elaboration_date])
      rescue ArgumentError
        params[:projpaymentauth][:elaboration_date] = nil
      end
    end
    
    @pay = Projpaymentauth.find(params[:id])
    
    if @pay.update_attributes(projpaymentauth_params)
      redirect_to projpaymentauth_url(@pay)
    else
      render 'edit'
    end
  end
  
  private
  
    def projpaymentauth_params
      params.require(:projpaymentauth).permit(:registry, :recipient, :from, :elaboration_date, :delivery_date, :delivered_id, :concept, :amount, :observations, :recieved_by, :is_valid)
    end
  
end
