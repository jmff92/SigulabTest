class ApplicationsController < ApplicationController
  layout 'bootlayout'
  before_filter :authenticate_user!
  before_action :set_application, only: [:show, :edit, :update, :destroy]


  # GET /applications
  # GET /applications.json
  def index
    @applications = Application.all
    @sumSolicitudes = Application.all.count
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
    @id = params[:id]
    @application = Application.find(params[:id])
    @relation_service = RelationService.all.select(:item).where(servicio: @application.id.to_s)
    @equipment = Equipment.where(id2: @relation_service)
    @instruments = Instrument.where(id2: @relation_service)
    @tools = Tool.where(id2: @relation_service)
    
    respond_to do |format|
      format.html
      format.pdf do
        pdf = SolicitudServicio.new(@application)
        send_data pdf.render, filename: 'SolicitudServicio.pdf', type: 'application/pdf'
      end
    end
  end

  # GET /applications/new
  def new
    @id = params[:item_ids]
    @application = Application.new
    @equipment = Equipment.where(id2: params[:item_ids])
    @instruments = Instrument.where(id2: params[:item_ids])
    @tools = Tool.where(id2: params[:item_ids])
  
    @sumE = Equipment.where(id2: params[:item_ids]).count
    @sumI = Instrument.where(id2: params[:item_ids]).count
    @sumT = Tool.where(id2: params[:item_ids]).count
    
  end

  # GET /applications/1/edit
  def edit
    @id = params[:item_ids]

    @equipment = Equipment.where(id2: params[:item_ids])
    @instruments = Instrument.where(id2: params[:item_ids])
    @tools = Tool.where(id2: params[:item_ids])

  end

  # POST /applications
  # POST /applications.json
  def create
    @ids = params[:item_ids].split(" ")
    @application = Application.new(application_params)
    @equipment = Equipment.where(id2: @ids)
    @instruments = Instrument.where(id2: @ids)
    @tools = Tool.where(id2: @ids)

    respond_to do |format|
      if @application.save

        @equipment.each do |equipment|
          @relation_service = RelationService.new
          @relation_service.servicio = @application.id.to_s
          @relation_service.item = equipment.id2
          @relation_service.save
        end

        @instruments.each do |instrument|
          @relation_service = RelationService.new
          @relation_service.servicio = @application.id.to_s
          @relation_service.item = instrument.id2
          @relation_service.save
        end

        @tools.each do |tool|
          @relation_service = RelationService.new
          @relation_service.servicio = @application.id.to_s
          @relation_service.item = tool.id2
          @relation_service.save
        end
        format.html { redirect_to @application, :equipment => @equipment, :instrument => @instruments, :tools => @tools}
        #format.html { redirect_to @application, :item_ids => params[:item_ids] }
        format.json { render :show, status: :created, location: @application }
      else
        format.html { render :new }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to @application }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to applications_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(:fechaRequerida, :descripcion, :uso)
    end
end
