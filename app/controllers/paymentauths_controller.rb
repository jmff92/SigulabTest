class PaymentauthsController < ApplicationController
  layout 'bootlayout'

  before_filter :authenticate_user!
  
  def index
    if current_user.gsmp?
      @pays = Paymentauth.all.order("elaboration_date ASC")
    elsif current_user.quality? or current_user.quality_analist? or current_user.import? or current_user.import_analist? or current_user.labBoss?
      # Filtrar aca solo las de la coordinacion o laboratorio del current_user
      @pays = Paymentauth.all.order("elaboration_date ASC")
    else
      # @pays = Paymentauth.all.where("user=?", current_user.username).order("elaboration_date ASC")
      @pays = Paymentauth.all
    end
  end

  def show
    @pay = Paymentauth.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = AutorizacionPago.new(@pay)
        send_data pdf.render, filename: 'AutorizacionPago.pdf', type: 'application/pdf'
      end
    end
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

  def annul
    @pay = Paymentauth.find(params[:id])
    @pay.update_column(:status, "annulled")
    redirect_to :back
  end  

  def delete
    @pay = Paymentauth.find params[:id]
   @pay.destroy
    redirect_to action: 'index'
  end  
  
  private
  
    def paymentauth_params
      params.require(:paymentauth).permit(:registry, :recipient, :from, :elaboration_date, :delivery_date, :delivered_id, :concept, :amount, :observations, :recieved_by, :is_valid, :user)
    end
  
end
