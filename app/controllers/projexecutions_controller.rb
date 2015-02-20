class ProjexecutionsController < ApplicationController
  layout 'bootlayout'

  before_filter :authenticate_user!

  def index
    if params[:id]
      @project = Project.find(params[:id])
    end           
    @projexecutions = Projexecution.order("date ASC").where("proyecto=?",params[:id])
    @sum = @projexecutions.where("check_annulled=false").where("proyecto=?",params[:id]).sum(:check_amount)
  end

   def show
     @execution = Projexecution.find(params[:id])
     @projexecutions = Projexecution.where("commitment_id=?",params[:cid])
     @sum = @projexecutions.where("check_annulled=false").sum(:check_amount)
   end

   def list
     @execution = Projexecution.find(params[:cid])
     @projexecutions = Projexecution.where("commitment_id=?",params[:cid])
     @sum = @projexecutions.where("check_annulled=false").sum(:check_amount)
     @commitments = Projcommitment.find(params[:cid])
     @sum_commitment = @commitments.amount
   end
  
   def new
     @projexecution = Projexecution.new
     if params[:cid]
       @commitment = Projcommitment.find(params[:cid])
       @projexecution.commitment_id = params[:cid]
       @projexecution.proyecto = @commitment.proj_id
     end
   end
  
   def create
binding.pry
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
         render 'new'
       else 
         if @projexecution.save
           redirect_to action: 'index'
         else
           render 'new'        
         end
       end
     else
       if @projexecution.save
         redirect_to action: 'index'
       else
         render 'new'        
       end   
     end   
   end
  
   def edit
     @execution = Projexecution.find(params[:id])
     @commitment = Commitment.find(Projexecution.find(params[:id]).commitment_id) 
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
     @execution = Projexecution.find(params[:id])
     @commitment = Commitment.find(Projexecution.find(params[:id]).commitment_id)    

     @oldamount = @Projexecution.check_amount    
     @projexecutions = Projexecution.where("commitment_id=?",@Projexecution.commitment_id)
     @projexecuted = @projexecutions.where("check_annulled=false").sum(:check_amount) - @oldamount

     if params[:projexecution][:check_amount].to_i > @commitment.amount - @projexecuted
       @Projexecution.executable_amount
       render 'edit'
     else 
       if @Projexecution.update_attributes(execution_params)
         redirect_to action: 'index'
       else
         @commitment = Commitment.find(Projexecution.find(params[:id]).commitment_id)
         render 'edit'
       end
     end    
   end

   def annul
     @execution = Projexecution.find(params[:id])
     @Projexecution.update_attribute(:check_annulled, true)
     redirect_to :back
   end
  
   private
       def execution_params
         params.require(:projexecution).permit(:code, :commitment_id, :proyecto, :check_amount, :check_number, :check_elaboration_date, :document, :check_sign_date, :check_delivery_date, :remarks)
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