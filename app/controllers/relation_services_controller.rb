class RelationServicesController < ApplicationController
  before_action :set_relation_service, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @relation_services = RelationService.all
    respond_with(@relation_services)
  end

  def show
    respond_with(@relation_service)
  end

  def new
    @relation_service = RelationService.new
    respond_with(@relation_service)
  end

  def edit
  end

  def create
    @relation_service = RelationService.new(relation_service_params)
    flash[:notice] = 'RelationService was successfully created.' if @relation_service.save
    respond_with(@relation_service)
  end

  def update
    flash[:notice] = 'RelationService was successfully updated.' if @relation_service.update(relation_service_params)
    respond_with(@relation_service)
  end

  def destroy
    @relation_service.destroy
    respond_with(@relation_service)
  end

  private
    def set_relation_service
      @relation_service = RelationService.find(params[:id])
    end

    def relation_service_params
      params.require(:relation_service).permit(:servicio, :item)
    end
end
