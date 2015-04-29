class PaymentauthsController < ApplicationController
  layout 'bootlayout'

  before_filter :authenticate_user!
  
  def index
    @pays = Paymentauth.all.order("elaboration_date ASC")
  end

  def show
    @pay = Paymentauth.find(params[:id])
  end
  
  def new
    @pay = Paymentauth.new
    @labs = Lab.all
  end
  
  def create
    # Check Date
    unless params[:paymentauth].nil?
      begin
        params[:paymentauth][:elaboration_date] = Date.parse(params[:paymentauth][:elaboration_date])
      rescue ArgumentError
        params[:paymentauth][:elaboration_date] = nil
      end
    end
    
    @pay = Paymentauth.new(paymentauth_params)
    
    if @pay.save
      redirect_to action: 'index'
    else
      @labs = Lab.all
      render 'new'
    end
  end
  
  def edit
    @pay = Paymentauth.find(params[:id])
    @labs = Lab.all
  end
  
  def update
    # Check Date
    unless params[:paymentauth].nil?
      begin
        params[:paymentauth][:elaboration_date] = Date.parse(params[:paymentauth][:elaboration_date])
      rescue ArgumentError
        params[:paymentauth][:elaboration_date] = nil
      end
    end
    
    @pay = Paymentauth.find(params[:id])
    
    if @pay.update_attributes(paymentauth_params)
      redirect_to action: 'index'
    else
      @labs = Lab.all
      render 'edit'
    end
  end
  
  private
  
    def paymentauth_params
      params.require(:paymentauth).permit(:registry, :recipient, :from, :elaboration_date, :delivery_date, :delivered_id, :concept, :amount, :observations, :recieved_by, :is_valid)
    end
  
end
