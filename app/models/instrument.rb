require "unicode_utils"
class Instrument < ActiveRecord::Base
	validates :name, :presence => {:message => "no puede ser blanco"}
# 	validates :national_good, :uniqueness => {:message => "ya existe otro instrumento con el mismo numero de bien nacional"}
	validates :dependency, :presence => {:message => "no puede ser blanco"}
	validates :location, :presence => {:message => "no puede ser blanco"}
	validates :responsible, :presence => {:message => "no puede ser blanco"}
	validates :measurement_unit, :presence => {:message => "no puede ser blanco"}
	before_save :uppercase_fields
	before_update :uppercase_fields
	has_many :table_items_solicitud

	validate :fechas

	def fechas
		if origen == "Donado"
			if !FechaDonacion
				errors.add(:FechaDonacion,"No puede ser vacio para una ítem donado")
			end
			if !NumDonacion
				errors.add(:NumDonacion,"No puede ser vacio para una ítem donado")
			end
			if !PJDonacion
				errors.add(:PJDonacion,"No puede ser vacio para una ítem donado")
			end
			if !PersonaContactoDonacion
				errors.add(:PersonaContactoDonacion,"No puede ser vacio para una ítem donado")
			end
		end
	    if adquisition_date != nil
		    if adquisition_date > Date.today
		    	errors.add(:adquisition_date,"no puede ser posterior a la fecha actual.")
		    end
		end
		if FechaDonacion
		    if FechaDonacion > Date.today
		    	errors.add(:FechaDonacion,"no puede ser posterior a la fecha actual.")
		    end
		end
		if last_calibration
			if last_calibration > Date.today
		      errors.add(:last_calibration, "no puede ser posterior a la fecha de actual.")
		    end
		end
	end
	
	def self.search(query)
		query=UnicodeUtils.upcase(query, :es)
		where("name like ?", "%#{query}%") 
	end
	
	private
	def uppercase_fields
		self.name=UnicodeUtils.upcase(self.name, :es)
		self.brand=UnicodeUtils.upcase(self.brand, :es)
		self.measurement_unit=UnicodeUtils.upcase(self.measurement_unit, :es)
		self.material=UnicodeUtils.upcase(self.material, :es)
		self.status=UnicodeUtils.upcase(self.status, :es)
		self.location=UnicodeUtils.upcase(self.location, :es)
		self.responsible=UnicodeUtils.upcase(self.responsible, :es)
		self.bill=UnicodeUtils.upcase(self.bill, :es)
		self.buy_order=UnicodeUtils.upcase(self.buy_order, :es)
		self.dependency=UnicodeUtils.upcase(self.dependency, :es)
	end
end
