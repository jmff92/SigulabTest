class Donation < ActiveRecord::Base

  has_many :item_donados
  accepts_nested_attributes_for :item_donados, allow_destroy: true


mount_uploader :document, AttachmentUploader # Tells rails to use this uploader for this model.

	
	validates :estimado, :presence => {:message => "no puede ser blanco"}
	validates :numDocumento, :presence => {:message => "no puede ser blanco"}
end

