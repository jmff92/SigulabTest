require "unicode_utils"
class Consumable < ActiveRecord::Base
	validates :name, :presence => {:message => "no puede ser blanco"}
	validates :dependency, :presence => {:message => "no puede ser blanco"}
	validates :location, :presence => {:message => "no puede ser blanco"}
	validates :responsible, :presence => {:message => "no puede ser blanco"}
	has_many :table_items_solicitud
	
	def self.search(query)
		query=UnicodeUtils.upcase(query, :es)
		where("name like ?", "%#{query}%") 
	end

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

	end
	
	before_save :uppercase_fields
	before_update :uppercase_fields

	private
	def uppercase_fields
		self.name=UnicodeUtils.upcase(self.name, :es)
		self.material=UnicodeUtils.upcase(self.material, :es)
		self.quantity=UnicodeUtils.upcase(self.quantity, :es)
		self.location=UnicodeUtils.upcase(self.location, :es)
		self.responsible=UnicodeUtils.upcase(self.responsible, :es)
		self.bill=UnicodeUtils.upcase(self.bill, :es)
		self.buy_order=UnicodeUtils.upcase(self.buy_order, :es)
		self.dependency=UnicodeUtils.upcase(self.dependency, :es)
	end

end
