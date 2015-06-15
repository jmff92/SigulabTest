class Binnacle < ActiveRecord::Base

	validates_presence_of :fecha
	validates_presence_of :tipo
	validates_presence_of :descripcion
	validates_presence_of :idSustancia
	belongs_to :chemical_substance

	validate :fechas

	def fechas
	    if fecha > Date.today
	      errors.add(:fecha, "no puede ser posterior a la fecha de actual.")
	    end
	end

	validate :totales

	def totales
		if total < 0
			errors.add(:total, "No puede consumir una cantidad mayor a la existente en inventario.")			
		end		
	end
end
