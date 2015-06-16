class Requisition < ActiveRecord::Base
    mount_uploader :attachment, AttachmentUploader
	validates_presence_of :solicitante, :message => "no puede estar en blanco." 
	validates_presence_of :numero, :message => "de requisicion no puede estar en blanco." 
	validates_numericality_of :numero, :greater_than => 0, :message => "debe ser un numero mayor que 0."
	validates_presence_of :created_at, :message => "no puede estar en blanco."
	validates_presence_of :attachment, :message => "debe ser cargado en el campo Requisicion." 
	belongs_to :user
end
