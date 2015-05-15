class Relation < ActiveRecord::Base
  UnidadMedida = ['cm', 'm', 'in', 'pies']
  UnidadMedida2 = ['gr','Kg','lb']
  
  validates_presence_of :marca, :message => " no puede estar en blanco" 
  validates_presence_of :modelo, :message => " no puede estar en blanco"
  validates_numericality_of :alto, :greater_than => 0, :message => "debe ser un numero mayor que 0"
  validates_presence_of :alto, :message => "del Item no puede estar en blanco"
  validates_presence_of :largo, :message => " no puede estar en blanco"
  validates_numericality_of :largo, :greater_than_or_equal_to => 0, :message => "debe ser un numero mayor que 0"
  validates_presence_of :ancho, :message => " no puede estar en blanco"
  validates_numericality_of :ancho, :greater_than_or_equal_to => 0, :message => "debe ser un numero mayor que 0"
  validates_presence_of :peso, :message => " no puede estar en blanco"
  validates_numericality_of :peso, :greater_than_or_equal_to => 0, :message => "debe ser un numero mayor que 0"
  validates_presence_of :dimensiones_alto, :message => " no puede estar en blanco" 
  validates_presence_of :dimensiones_ancho, :message => " no puede estar en blanco"
  validates_presence_of :dimensiones_largo, :message => " no puede estar en blanco" 
  validates_presence_of :dimensiones_peso, :message => " no puede estar en blanco" 
 
  belongs_to :user
end
