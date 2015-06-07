class PaymentauthsController < ApplicationController
  layout 'bootlayout'

  before_filter :authenticate_user!
  
  def index
    # Autorizaciones agregadas por el usuario
    if current_user.gsmp?
      @pays = Paymentauth.all.where("\"user\"=?", current_user.username).order("elaboration_date ASC")
    # Autorizaciones de una coordinacion  
    elsif current_user.quality? or current_user.quality_analist?
      # PENDIENTE
      @pays = Paymentauth.all.order("elaboration_date ASC")
    elsif current_user.import? or current_user.import_analist?
      # PENDIENTE
      @pays = Paymentauth.all.order("elaboration_date ASC")  
    elsif current_user.labBoss?
      # PENDIENTE
      @pays = Paymentauth.all.order("elaboration_date ASC")  
    # Todas las autorizaciones de pago  
    else 
      @pays = Paymentauth.all.order("elaboration_date ASC")
    end
  end

  def show  
    @pay = Paymentauth.find(params[:id])
    @status = @pay.status
    respond_to do |format|
      format.html
      format.pdf do
        pdf = AutorizacionPago.new(@pay)
        send_data pdf.render, filename: 'AutorizacionPago.pdf', type: 'application/pdf'
        @pay.update_column(:status, "generated")
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
    @pay = Paymentauth.find(params[:id])
    @old_date = @pay.delivery_date
    @new_date = paymentauth_params[:delivery_date]
    
    if @pay.update_attributes(paymentauth_params)
      # Si cambio fecha de recepcion (nil a fecha), se genera compromiso
        if (@old_date == nil) and (@new_date != "")
        @commitment = Commitment.new
        if Commitment.count > 0
          @commitment.id = Commitment.last.id+1
        else
          @commitment.id = 1
        end
        if Paymentauth.froms[@pay.from] < 9
          @commitment.lab_id = Paymentauth.froms[@pay.from]
        else
          @commitment.lab_id = 0
        end
        @commitment.code = @pay.registry
        @commitment.amount = @pay.amount
        @commitment.description = @pay.concept
        @commitment.recipient = @pay.recipient
        @commitment.date = @pay.elaboration_date
        @commitment.sae_code = sae(@pay.from)
        @commitment.observations = @pay.observations
        @commitment.document = 2
        @commitment.created_at = @pay.created_at
        @commitment.updated_at = @pay.updated_at
        @commitment.save      
      end
      redirect_to paymentauth_url(@pay)
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
    @pay = Paymentauth.find(params[:id]).destroy
    redirect_to action: 'index'
  end  
  
  private
  
    def paymentauth_params
      params.require(:paymentauth).permit(:registry, :recipient, :from, :elaboration_date, :delivery_date, :delivered_id, :concept, :amount, :observations, :recieved_by, :is_valid, :user)
    end

    def sae(id)
      if id == 0
        return "01.05.03.01"
      elsif id == 1
        return "01.05.03.03"
      elsif id == 2
        return "01.05.03.04"
      elsif id == 3
        return "01.05.03.05"
      elsif id == 4
        return "01.05.03.06"
      elsif id == 5
        return "01.05.03.07"
      elsif id == 6
        return "01.05.03.08"   
      elsif id == 7
        return "01.05.03.09"
      elsif id == 8
        return "01.05.03.02"
      else
        return "01.05.03.01"
      end
    end
  
end
