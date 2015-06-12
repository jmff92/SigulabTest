class Invitation < ActiveRecord::Base
  validates_presence_of :rif, :message => "de la empresa no puede estar en blanco."
  validates_format_of :rif, with: /(^[JGVEP][-][0-9]{8}[-][0-9]$)|N\/A/i, on: :create, :message => "tiene que tener un formato correcto (J-/G-/V-/E-/P-)"

	validates_presence_of :nombre, :message => "de la empresa no puede estar en blanco."
	validates_presence_of :direccion, :message => "de la empresa no puede estar en blanco."
  validates_presence_of :responsable, :message => "no puede estar en blanco."
	validates_presence_of :correo, :message => "del solicitante no puede estar en blanco."
  validates_format_of :correo, with: /\A([^@\s]+)@usb.ve/i, on: :create, :message => "tiene que ser de la forma usuario@usb.ve"
	validates_presence_of :numero_fax, :message => "del solicitante no puede estar en blanco."
  validates_numericality_of :numero_fax, :message => "del solicitante debe contener solo numeros."
  validates_length_of :numero_fax, is: 11, :message => "del solicitante no tiene el largo adecuado."
  validates :telefono, presence: false
  validates_numericality_of :telefono, :message => "del solicitante debe contener solo numeros.", allow_blank: true
  validates_length_of :telefono, is: 11, :message => "del solicitante no tiene el largo adecuado.", allow_blank: true
   belongs_to :user
end
