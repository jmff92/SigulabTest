class Poa < ActiveRecord::Base

  mount_uploader :document, AttachmentUploader # Tells rails to use this uploader for this model.

  validates :document, presence: true
  validates :year, presence: true
  validates :year, numericality: { greater_than: 1980 }, if: "!year.blank?"

end
