class ProjexecutionsController < ApplicationController
  layout 'bootlayout'

  before_filter :authenticate_user!

  def index   
    if params[:id]
      @project = Project.find(params[:id])
    end           
    @projexecutions = Projexecution.order("date ASC").where("proyecto=?",params[:id]).where("valid_res=?", true)
    @sum = @projexecutions.where("check_annulled=false").where("proyecto=?",params[:id]).sum(:check_amount)
  end

  def all
    @projexecutions = Projexecution.all.order("date ASC").where("valid_res=?", true)
    @sum = @projexecutions.where("check_annulled=false").sum(:check_amount)
  end

   def show
     @projexecution = Projexecution.find(params[:id]).where("valid_res=?", true)
     @projcommitment = Projcommitment.find(@projexecution.commitment_id).where("valid_res=?", true)
     @project = Project.find(@projcommitment.proj_id).where("valid_res=?", true)
     @projexecutions = Projexecution.where("commitment_id=?",params[:id]).where("valid_res=?", true)
     @sum = @projexecutions.where("check_annulled=false").sum(:check_amount)
   end

   def list
     @projexecutions = Projexecution.where("commitment_id=?",params[:cid]).where("valid_res=?", true)
     @sum = @projexecutions.where("check_annulled=false").sum(:check_amount)
     @commitments = Projcommitment.find(params[:cid]).where("valid_res=?", true)
     @project = Project.find(@commitments.proj_id).where("valid_res=?", true)
     @sum_commitment = @commitments.amount
   end
  
   def new
     @projexecution = Projexecution.new
     if params[:cid]
       @commitment = Projcommitment.find(params[:cid])
       @projexecution.commitment_id = params[:cid]
       @projexecution.proyecto = @commitment.proj_id
       @project = Project.find(@commitment.proj_id)
       @executed = Projexecution.where("commitment_id=?",params[:cid]).where("check_annulled=false").sum(:check_amount)       
     end
   end
  
   def create
     # Check Date
     unless params[:projexecution].nil?
       begin
         params[:projexecution][:check_elaboration_date] = Date.parse(params[:projexecution][:check_elaboration_date])
       rescue ArgumentError
         params[:projexecution][:check_elaboration_date] = nil
       end
     end
   
     @projexecution = Projexecution.new(execution_params)
     @commitment = Projcommitment.find(params[:cid])    
     @projexecutions = Projexecution.where("commitment_id=?",params[:cid])
     @projexecuted = @projexecutions.where("check_annulled=false").sum(:check_amount)
     if !@projexecution.check_amount.blank?
       if @projexecution.check_amount > @commitment.amount - @projexecuted
         @projexecution.executable_amount
         render 'new', cid: params[:cid]
       else 
         if @projexecution.save
           redirect_to controller: 'projexecutions', id: @projexecution.proyecto
         else
           render 'new', cid: params[:cid]        
         end
       end
     else
       if @projexecution.save
         redirect_to controller: 'projexecutions', id: @projexecution.proyecto
       else
         render 'new'        
       end   
     end   
   end
  
   def edit
     @projexecution = Projexecution.find(params[:id])
     @project = Project.find(Projexecution.find(params[:id]).proyecto) 
     @commitment = Projcommitment.find(Projexecution.find(params[:id]).commitment_id)
   end
  
   def update
     # Check Date
     unless params[:projexecution].nil?
       if !params[:projexecution][:check_elaboration_date].nil?
         begin
           params[:projexecution][:check_elaboration_date] = Date.parse(params[:projexecution][:check_elaboration_date])
         rescue ArgumentError
           params[:projexecution][:check_elaboration_date] = nil
         end
       end
     end
     @projexecution = Projexecution.find(params[:id]).where("valid_res=?", true)
     @commitment = Projcommitment.find(Projexecution.find(params[:id]).commitment_id).where("valid_res=?", true)    

     @oldamount = @projexecution.check_amount    
     @projexecutions = Projexecution.where("commitment_id=?", @projexecution.commitment_id).where("valid_res=?", true)
     @projexecuted = @projexecutions.where("check_annulled=false").sum(:check_amount) - @oldamount

     if params[:projexecution][:check_amount].to_i > @commitment.amount - @projexecuted
       @projexecution.executable_amount
       render 'edit'
     else 
       if @projexecution.update_attributes(execution_params)
         redirect_to action: 'index', id: @projexecution.proyecto
       else
         @commitment = Projcommitment.find(Projexecution.find(params[:id]).commitment_id)
         render 'edit'
       end
     end    
   end

   def annul
     @projexecution = Projexecution.find(params[:id])
     @projexecution.update_attribute(:check_annulled, true)
     redirect_to :back
   end

  def valid
    @projexecution = Projexecution.find(params[:id])
    @projexecution.update_attribute(:valid_res, true)
    redirect_to :back
  end     

  def delete
    @projexecution = Projexecution.find params[:id]
    @projexecution.destroy
    redirect_to :back    
  end       
  
   private
       def execution_params
         params.require(:projexecution).permit(:code, :commitment_id, :proyecto, :check_amount, :check_number, :check_elaboration_date, :document, :check_sign_date, :check_delivery_date, :remarks, :document_date, :invoice_number, :invoice_date, :valid)
     end
    
     def purge_date(date)
       return date if date.blank?
       begin
         date = Date.parse(date)
       rescue ArgumentError
         return nil
       end
       return date
     end


end
