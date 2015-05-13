class Poa < ActiveRecord::Base
  mount_uploader :document, AttachmentUploader # Tells rails to use this uploader for this model.

end
