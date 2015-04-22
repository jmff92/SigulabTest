class RecordsController < ApplicationController
  layout 'bootlayout'
  before_action :set_record, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  respond_to :html

  def index
    if params[:format]
      @records = Record.where(idEquipo: params[:format])
    end
    @equipos = Equipment.where(id2: params[:format])
    @id = params[:format]
  end

  def show
    respond_with(@record)
  end

  def new
    @record = Record.new
    if params[:format]
      @id = params[:format]
    else
      @id = params[:formato]
    end
  end

  def edit
  end

  def create
    @record = Record.new(record_params)
    flash[:notice] = 'Record was successfully created.' if @record.save
    respond_with(@record)
  end

  def update
    flash[:notice] = 'Record was successfully updated.' if @record.update(record_params)
    respond_with(@record)
  end

  def destroy
    @record.destroy
    respond_with(@record)
  end

  private
    def set_record
      @record = Record.find(params[:id])
    end

    def record_params
      params.require(:record).permit(:fecha, :nos, :tipoServicio, :descripcion, :fechaini, :fechafin, :observaciones)
    end
end
