# encoding: utf-8
class Item < ActiveRecord::Base
  
  TipoItem = ['Equipos y mobiliarios', 'Instrumentos de medición', 'Herramientas', 
              'Sustancias químicas', 'Consumibles y materiales']
            
  UnidadMedida = ['cms', 'mts', 'in']

  validates_presence_of :tipo, :message => "del Item no puede estar en blanco" 
  validates_presence_of :nombre, :message => "del Item no puede estar en blanco"
  validates_numericality_of :cantidad, :greater_than => 0, :message => "debe ser un número mayor que 0"
  validates_presence_of :cantidad, :message => "del Item no puede estar en blanco"
  validates :descripcion, presence: false
  
  belongs_to :user

end
