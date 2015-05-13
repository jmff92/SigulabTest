class Requisition < ActiveRecord::Base
    mount_uploader :archivo, AttachmentUploader
	validates_presence_of :solicitante, :message => "no puede estar en blanco." 
	validates_presence_of :numero, :message => "del equipo no puede estar en blanco." 
	validates_numericality_of :numero, :greater_than => 0, :message => "debe ser un numero mayor que 0."
	belongs_to :user
end
