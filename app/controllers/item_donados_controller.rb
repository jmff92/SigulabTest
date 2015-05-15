class ItemDonadosController < ApplicationController
  def new
  	@itemdonado = ItemDonado.new
  	@donation_id = params[:donation_id]
  end

  def create
    @itemdonado = ItemDonado.new(item_donados_params)
  	@donation_id = params[:donation_id]
  	@itemdonado.donation_id = @donation_id
  	@itemdonado.save
  	redirect_to donation_path(@donation_id)
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
