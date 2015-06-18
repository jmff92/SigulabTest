class Loan < ActiveRecord::Base

	validates_presence_of :medida, :presence => {:message => "no puede estar en blanco"}
	validates_presence_of :condiciones, :presence => {:message => "no puede estar en blanco"}
	validates_presence_of :periodo, :presence => {:message => "no puede estar en blanco"}
	validates_presence_of :inicio, :presence => {:message => "no puede estar en blanco"}
	validates_presence_of :hasta, :presence => {:message => "no puede estar en blanco"}
	validates_presence_of :ubicacion, :presence => {:message => "no puede estar en blanco"}
	validates_presence_of :maxDevolucion, :presence => {:message => "no puede estar en blanco"}
	validates_presence_of :persona, :presence => {:message => "no puede estar en blanco"}
	validates_presence_of :cedula, :presence => {:message => "no puede estar en blanco"}
	has_many :table_items_solicitud

	validate :fechas

	def fechas
	    if hasta < inicio
	      errors.add(:hasta, "no puede ser posterior a la fecha inicial")
	    end
	    if (maxDevolucion < inicio)
	    	errors.add(:maxDevolucion,"no puede ser posterior a la fecha inicial")
	    end
	    if maxDevolucion < hasta
	    	errors.add(:maxDevolucion,"no puede ser menor a la fecha final de uso")
	    end
	end

end
