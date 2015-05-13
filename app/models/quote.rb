class Quote < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  validates :nombre, presence: true
  validates_presence_of :attachment
  belongs_to :user
end
