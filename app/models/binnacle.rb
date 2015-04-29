class Binnacle < ActiveRecord::Base

	validates_presence_of :fecha
	validates_presence_of :consumo
	validates_presence_of :ingreso
	validates_presence_of :tipo
	validates_presence_of :descripcion
	belongs_to :chemical_substance
end
