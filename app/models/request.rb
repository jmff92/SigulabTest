class Request < ActiveRecord::Base
  Fondos = ['El FONACIT', 'El Decanato de Investicacion y Desarrollo', 'FUNINDES', 'El Presupuesto Ordinario, ULab', 'El Presupuesto Ordinario D.S.T.', 'Accesorio', 'Otro']
  Cuenta = ['Ahorro', 'Corriente']
  
  mount_uploader :proforma, AttachmentUploader
  mount_uploader :fonacit, AttachmentUploader
  mount_uploader :folleto, AttachmentUploader
  mount_uploader :acta_consejo_directo, AttachmentUploader
  
  validates_presence_of :unidad_solicitante, :message => " no puede estar en blanco."
	validates_presence_of :persona_contacto, :message => " no puede estar en blanco."
	validates_presence_of :email, :message => "del solicitante no puede estar en blanco."
  validates_format_of :email, with: /\A([^@\s]+)@usb.ve/i, on: :create, :message => "tiene que ser de la forma usuario@usb.ve"
	validates_presence_of :telefono, :message => " no puede estar en blanco."
  validates_numericality_of :telefono, :message => " debe contener solo numeros."
  validates_length_of :telefono, is: 11, :message => " debe tener 11 numeros de largo."
 
  
  belongs_to :user
end
