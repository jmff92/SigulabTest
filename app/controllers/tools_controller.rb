class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :edit, :update, :destroy]
  layout 'bootlayout'
  before_filter :authenticate_user!
  # GET /tools
  # GET /tools.json
  def index
    @tools = Tool.all
	if params[:search]
		@tools = Tool.search(params[:search])
	else
		@tools = Tool.all.order('created_at DESC')
	end
  @sum = Tool.count
  end

  # GET /tools/1
  # GET /tools/1.json
  def show
   @sum = Tool.count
    @id = @tool.id2
    @relation_service = RelationService.where(item: @id).pluck(:servicio)
    @applications = Application.where(id: @relation_service)
  end

  # GET /tools/new
  def new
    @tool = Tool.new
  end

  # GET /tools/1/edit
  def edit
  end

  # POST /tools
  # POST /tools.json
  def create
    @tool = Tool.new(tool_params)

    respond_to do |format|
      if @tool.save
        format.html { redirect_to @tool }
        format.json { render :show, status: :created, location: @tool }
      else
        format.html { render :new }
        format.json { render json: @tool.errors, status: :unprocessable_entity }
      end
    end
    @tool.id2 = "HE-" + "#{@tool.id}"
    @tool.save
  end

  # PATCH/PUT /tools/1
  # PATCH/PUT /tools/1.json
  def update
    respond_to do |format|
      if @tool.update(tool_params)
        format.html { redirect_to @tool }
        format.json { render :show, status: :ok, location: @tool }
      else
        format.html { render :edit }
        format.json { render json: @tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tools/1
  # DELETE /tools/1.json
  def destroy
    @tool.destroy
    respond_to do |format|
      format.html { redirect_to tools_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tool
      @tool = Tool.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tool_params
      params.require(:tool).permit(:name, :brand, :national_good, :status, :responsible, :location, :material, :bill, :from_set, :investigation, :teaching, :extention, :management, :cost, :buy_order, :adquisition_date, :showable, :dependency, :tipo)
    end
end
