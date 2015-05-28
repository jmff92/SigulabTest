class RejectsController < ApplicationController
  layout "application_compras"
  respond_to :html, :xml, :json

  # GET /requisitions
  # GET /requisitions.json
  def index
    if current_user
    @reject = Reject.where(:specification_id => session[:specification_sel_id]).first 
    @rejectN = Reject.where(:specification_id => session[:specification_sel_id]).count
    if @rejectN != 0
		if @reject.estado != "Aceptar solicitud"
			redirect_to "/devolutions"
		end
	else
		redirect_to "/rejects/new"
    end
    
    end
  end

  # GET /requisitions/1
  # GET /requisitions/1.json
  def show

  end

  # GET /requisitions/new
  def new
    @reject = Reject.new
  end

  # GET /requisitions/1/edit
  def edit
  end

  # POST /requisitions
  # POST /requisitions.json
  def create
    @reject = Reject.new(reject_params)
    @reject.specification_id = session[:specification_sel_id]
    if "Rechazar solicitud" ==  @reject.estado
     @specification = Specification.where(:id => session[:specification_sel_id]).first 
    @specification.p1 = 1
    @specification.p2 = 1
    @specification.p3 = 1
    @specification.p4 = 1
    @specification.p5 = 1
    @specification.p6 = 1
    @specification.p7 = 1
    @specification.p8 = 1
    @specification.p9 = 1
    @specification.save
    end
    respond_to do |format|
      if @reject.save
        format.html { redirect_to "/rejects/", notice: 'Requisition was successfully created.' }
        format.json { render :show, status: :created, location: @requisition }
      else
        format.html { render :new }
        format.json { render json: @requisition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requisitions/1
  # PATCH/PUT /requisitions/1.json
  def update
    
  end

  # DELETE /requisitions/1
  # DELETE /requisitions/1.json
  def destroy
    @reject.destroy
    respond_to do |format|
      format.html { redirect_to rejects_url, notice: 'Requisition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


    # Never trust parameters from the scary internet, only allow the white list through.
    def reject_params
      params.require(:reject).permit(:estado)
    end
end
