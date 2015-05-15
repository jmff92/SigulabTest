# encoding: utf-8
class Service < ActiveRecord::Base
  TipoServicio = ['Reparación', 'Alquiler', 'Mantenimiento', 'Instalación', 'Calibración']
  validates_presence_of :numero, :message => "del equipo no puede estar en blanco."
  validates_numericality_of :numero, :greater_than => 0, :message => "debe ser un número mayor que 0"
  validates_presence_of :nombre, :message => "del equipo no puede estar en blanco."
  validates_presence_of :ubicacion, :message => "del equipo no puede estar en blanco."
  validates_presence_of :tipo, :message => "de servicio no puede estar en blanco."
  validates :descripcion, presence: false
  belongs_to :user

end
