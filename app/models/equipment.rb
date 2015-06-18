require "unicode_utils"
class Equipment < ActiveRecord::Base
	validates :name, :presence => {:message => "no puede ser blanco"}
	validates :serial,  :presence => {:message => "no puede ser blanco"}
	validates_uniqueness_of :national_good, :allow_blank => true, :allow_nil => true
# 	validates :national_good, :presence => {:message => "no puede ser blanco"}, :uniqueness => {:message => "ya existe otro equipo con el mismo numero de bien nacional"}
	validates :dependency, :presence => {:message => "no puede ser blanco"}
	validates :location, :presence => {:message => "no puede ser blanco"}
	validates :responsible, :presence => {:message => "no puede ser blanco"}
	has_many :table_items_solicitud
	attr_localized :cost
	validates :cost, numericality: { greater_than: 0 }, if: "!cost.blank?"
	

	validate :fechas

	def fechas
		if (calibrated == "Sí") && (last_calibration == nil)
			errors.add(:last_calibration,"Si el objeto está calibrado, introduzca fecha de última calibración")
		elsif (calibrated == "Sí") && (last_calibration != nil)
		    if last_calibration > Date.today
		      errors.add(:last_calibration, "no puede ser posterior a la fecha de actual.")
		    end
		end
	    if !(calibrated == "Sí") && !(last_calibration == nil)
	    	errors.add(:calibrated,"Si el campo Calibración es distinto de Sí, no puede tener Última Calibración")
	    end
	    if adquisition_date != nil
		    if adquisition_date > Date.today
		    	errors.add(:adquisition_date,"no puede ser posterior a la fecha actual.")
		    end
		end
		if origen == "Donado"
			if fechaDonacion == nil
				errors.add(:fechaDonacion,"No puede ser vacio para una ítem donado")
			end
			if numDonacion == nil
				errors.add(:numDonacion,"No puede ser vacio para una ítem donado")
			end
			if pJDonacion == nil
				errors.add(:pJDonacion,"No puede ser vacio para una ítem donado")
			end
			if personaContactoDonacion == nil
				errors.add(:personaContactoDonacion,"No puede ser vacio para una ítem donado")
			end
		end
		
		if fechaDonacion
		    if fechaDonacion > Date.today
		    	errors.add(:fechaDonacion,"no puede ser posterior a la fecha actual.")
		    end
		end

	end
	
	def self.search(query)
		query=UnicodeUtils.upcase(query, :es)
		where("name like ?", "%#{query}%") 
	end
	
	before_save :uppercase_fields
	before_update :uppercase_fields
	
	private
	def uppercase_fields
		self.name=UnicodeUtils.upcase(self.name, :es)
		self.brand=UnicodeUtils.upcase(self.brand, :es)
		self.model=UnicodeUtils.upcase(self.model, :es)
		self.serial=UnicodeUtils.upcase(self.serial, :es)
		self.responsible=UnicodeUtils.upcase(self.responsible, :es)
		self.location=UnicodeUtils.upcase(self.location, :es)
		self.measurelength=UnicodeUtils.upcase(self.measurelength, :es)
		self.measuredepth=UnicodeUtils.upcase(self.measuredepth, :es)
		self.measurewidth=UnicodeUtils.upcase(self.measurewidth, :es)
		self.bill=UnicodeUtils.upcase(self.bill, :es)
		self.buy_order=UnicodeUtils.upcase(self.buy_order, :es)
		self.dependency=UnicodeUtils.upcase(self.dependency, :es)
	end
end
