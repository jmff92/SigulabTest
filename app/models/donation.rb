class Donation < ActiveRecord::Base

	attr_localized :estimado

	has_many :item_donados
	accepts_nested_attributes_for :item_donados, allow_destroy: true


	mount_uploader :document, AttachmentUploader # Tells rails to use this uploader for this model.

	
	validates :estimado, :presence => {:message => "no puede ser blanco"}
	validates :estimado, numericality: { greater_than: 0 }, if: "!estimado.blank?"
	validates :numDocumento, :presence => {:message => "no puede ser blanco"}

	validate :fechas

	def fechas
		if fechaDocumento
			if fechaDocumento > Date.today
				errors.add(:fechaDocumento,"No puede ser posterior a la fecha actual.")
			end
		end
	end
	
end

