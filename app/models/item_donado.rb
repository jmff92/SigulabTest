class ItemDonado < ActiveRecord::Base
	belongs_to :donation
	validates :Nombre, :presence => {:message => "no puede ser blanco"}
	validates :Modelo, :presence => {:message => "no puede ser blanco"}
end
