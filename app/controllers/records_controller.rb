class RecordsController < ApplicationController
  layout 'bootlayout'
  before_action :set_record, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    if params[:format]
      @records = Record.where(idEquipo: params[:format])
    end
    @equipos = Equipment.where(id2: params[:format])
    if @equipos == []
      @equipos = Instrument.where(id2: params[:format])
    end
    if @equipos == []
      @equipos = Tool.where(id2: params[:format])
    end
    @id = params[:format]
  end

  def show
    @id = @record.idEquipo
    @item = Equipment.where(id2: @id)
    if @item == []
      @item = Instrument.where(id2: @id)
    end
    if @item == []
      @item = Tool.where(id2: @id)
    end
  end

  def new
    @record = Record.new
    if params[:format]
      @id = params[:format]
    else
      @id = params[:formato]
    end
    @item = Equipment.where(id2: @id)
    if @item == []
      @item = Instrument.where(id2: @id)
    end
    if @item == []
      @item = Tool.where(id2: @id)
    end
  end

  def edit
    @id = @record.idEquipo
    @item = Equipment.where(id2: @id)
    if @item == []
      @item = Instrument.where(id2: @id)
    end
    if @item == []
      @item = Tool.where(id2: @id)
    end
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to action: 'show', id: @record.id, format: @record.idEquipo
    else
      redirect_to action: 'new', format: @record.idEquipo, record: @record
    end
  end

  def update
    if @record.update(record_params)
      flash[:notice] = 'El registro se ha actualizado exitosamente.'
      redirect_to action: 'show', id: @record.id, format: @record.idEquipo
    else
      redirect_to action: 'edit', format: @record.idEquipo, record: @record
    end
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
      params.require(:record).permit(:fecha, :nos, :tipoServicio, :descripcion, :fechaini, :fechafin, :observaciones, :idEquipo)
    end
end
