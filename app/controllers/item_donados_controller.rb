class ItemDonadosController < ApplicationController
  def new
  	@itemdonado = ItemDonado.new
  	@donation_id = params[:donation_id]
    if params[:errors]
      @errors = params[:errors]
    end
  end

  def create
    @itemdonado = ItemDonado.new(item_donados_params)
    @donation_id = params[:donation_id]
    @itemdonado.donation_id = @donation_id

    respond_to do |format|
      if @itemdonado.save
        format.html { redirect_to @itemdonado }
        format.json { render :show, status: :created, location: @itemdonado }
        redirect_to donation_path(@donation_id)
      else
        format.html { redirect_to action: :new, :donation_id => @donation_id, :errors => itemdonado.errors.full_messages }
        format.json { render json: @itemdonado.errors, status: :unprocessable_entity }
      end
    end
    

  end

  def destroy
    item = ItemDonado.find(params[:id])
    @donation_id = item.donation_id
    item.destroy
    redirect_to donation_path(@donation_id)
  end

    def item_donados_params
      params.require(:item_donado).permit(:Nombre, :Marca, :Modelo, :UniDeMedida, :tipo)
    end
end
