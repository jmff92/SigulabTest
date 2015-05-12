class Donation < ActiveRecord::Base
	validates :nombreItem, :presence => {:message => "no puede ser blanco"}
	validates :cantidad, :presence => {:message => "no puede ser blanco"}
	validates :unidadMedida, :presence => {:message => "no puede ser blanco"}
	validates :estimado, :presence => {:message => "no puede ser blanco"}
mount_uploader :document, AttachmentUploader # Tells rails to use this uploader for this model.

	validates :numDocumento, :presence => {:message => "no puede ser blanco"}
end

