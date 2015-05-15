class Loan < ActiveRecord::Base
	#validates_presence_of :ubicacion, :presence => {:message => "no puede ser blanco"}
	#validates_presence_of :condiciones, :presence => {:message => "no puede ser blanco"}
	#validates_presence_of :fechaEntrega, :presence => {:message => "no puede ser blanco"}
	#validates_presence_of :fechaTope, :presence => {:message => "no puede ser blanco"}
	has_many :table_items_solicitud

	validate :fechas

	def fechas
		if hasta and fechaTope
		    if hasta > fechaTope
		      errors.add(:hasta, "no puede ser posterior a la fecha de petición")
		    end
		end
	end

end
