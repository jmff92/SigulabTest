class PaymentauthsController < ApplicationController
  layout 'bootlayout'

  before_filter :authenticate_user!
  
  def index
    # Autorizaciones agregadas por el usuario
    if current_user.gsmp?
      @pays = Paymentauth.all.where("\"user\"=?", current_user.username).order("elaboration_date ASC")
    # Autorizaciones de una coordinacion  
    elsif current_user.quality? or current_user.quality_analist?
      @pays = ((Paymentauth.joins(:user).where("quality_analist=? OR quality=?", true, true).where("valid_dir=?", true)) + (Paymentauth.all.where("user_id=?", current_user.id))).uniq.sort_by(&:"#{"elaboration_date"}")
    elsif current_user.import? or current_user.import_analist?
      @pays = ((Paymentauth.joins(:user).where("import_analist=? OR import=?", true, true).where("valid_dir=?", true)) + (Paymentauth.all.where("user_id=?", current_user.id))).uniq.sort_by(&:"#{"elaboration_date"}")
    elsif current_user.labBoss?
      @pays = ((Paymentauth.joins(:user).where("labBoss=? OR labassistant=?", true, true).where("valid_dir=?", true)) + (Paymentauth.all.where("user_id=?", current_user.id))).uniq.sort_by(&:"#{"elaboration_date"}")
    # Todas las autorizaciones de pago  
    else 
      @pays = ((Paymentauth.all.where("valid_coord=? AND valid_dir=?", true, true)) + (Paymentauth.all.where("user_id=?", current_user.id))).uniq.sort_by(&:"#{"elaboration_date"}")
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
    @pay.recipient = @pay.recipient.upcase
    @pay.concept = @pay.concept.upcase
    @pay.observations = @pay.observations.upcase
    @pay.recieved_by = @pay.recieved_by.upcase

    # Validacion de coordinacion segun el cargo del usuario
    if current_user.directorate? or current_user.gsmp? or current_user.acquisition? or current_user.manage? or current_user.import? or current_user.quality? or current_user.labBoss?
      @pay.valid_coord = true
      @pay.valid_dir = false
    else
      @pay.valid_coord = false
    end

    @pay.user_id = current_user.id.to_int

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
binding.pry    
    if !(params[:paymentauth][:recipient]).nil?
      params[:paymentauth][:recipient] = params[:paymentauth][:recipient].upcase
    end
    if !params[:paymentauth][:concept].nil?
      params[:paymentauth][:concept] = params[:paymentauth][:concept].upcase
    end
    if params[:paymentauth][:observations].nil?
      params[:paymentauth][:observations] = params[:paymentauth][:observations].upcase
    end
    if params[:paymentauth][:recieved_by].nil?
      params[:paymentauth][:recieved_by] = params[:paymentauth][:recieved_by].upcase
    end

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
        @commitment.sae_code = sae(Paymentauth.froms[@pay.from])
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

  def list_lab
    @lab = Lab.find(params[:id])
    @pays = Paymentauth.all.order("elaboration_date ASC").where("\"from\"=?", params[:id]).where("valid_dir=?", true)
  end
 
  def valid_dir_annull
    @pay = Paymentauth.find(params[:id])
    @pay.update_column(:status, "annulled")
    @pay.update_column(:annull, false)
    redirect_to :back
  end  

  def no_valid_dir
    @pay = Paymentauth.find(params[:id])
    @pay.update_column(:annull, false)
    redirect_to action: :notifications, controller: :administration    
  end

  def annul
    @pay = Paymentauth.find(params[:id])
    @pay.update_column(:annull, true)
    redirect_to :back
  end

  def validating
    @pay = Paymentauth.find(params[:id])
    @pay.update_column(:status, "validating")
    redirect_to :back
  end   

  def delete
    @pay = Paymentauth.find(params[:id]).destroy
    redirect_to action: 'index'
  end  
  
  def del
    @pay = Paymentauth.find(params[:id])
    @pay.update_column(:status, nil)
    @pay.update_column(:valid_coord, false)
    @pay.update_column(:valid_dir, false)    
    redirect_to :back    
  end    

  def valid_coord
    @pay = Paymentauth.find(params[:id])
    @pay.update_column(:valid_coord, true)
    @pay.update_column(:valid_dir, false)
    redirect_to :back
  end  

  def valid_dir
    @pay = Paymentauth.find(params[:id])
    @pay.update_column(:valid_dir, true)
    @pay.update_column(:status, "generated")
    redirect_to :back
  end     


  private
  
    def paymentauth_params
      params.require(:paymentauth).permit(:registry, :recipient, :from, :elaboration_date, :delivery_date, :delivered_id, :concept, :amount, :observations, :recieved_by, :is_valid, :user, :valid_coord, :valid_dir)
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
