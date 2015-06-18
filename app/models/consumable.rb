require "unicode_utils"
class Consumable < ActiveRecord::Base
	validates :name, :presence => {:message => "no puede ser blanco"}
	validates :dependency, :presence => {:message => "no puede ser blanco"}
	validates :location, :presence => {:message => "no puede ser blanco"}
	validates :responsible, :presence => {:message => "no puede ser blanco"}
	has_many :table_items_solicitud
	validates_presence_of :correo, :presence => {:message => "no puede ser blanco"}
	validates_format_of :correo, with: /\A(.[_a-z0-9-]+)*@usb.ve$\z/i, on: :create, :message => "debe ser @usb.ve"
	validates_format_of :correo, with: /\A(.[_a-z0-9-]+)*@usb.ve$\z/i, on: :update, :message => "debe ser @usb.ve"
	attr_localized :cost
	validates :cost, numericality: { greater_than: 0 }, if: "!cost.blank?"
	
	def self.search(query)
		query=UnicodeUtils.upcase(query, :es)
		where("name like ?", "%#{query}%") 
	end

	validate :fechas

	def fechas
		if origen == "Donado"
			if !fechaDonacion
				errors.add(:fechaDonacion,"No puede ser vacio para una ítem donado")
			end
			if !numDonacion
				errors.add(:numDonacion,"No puede ser vacio para una ítem donado")
			end
			if !pJDonacion
				errors.add(:pJDonacion,"No puede ser vacio para una ítem donado")
			end
			if !personaContactoDonacion
				errors.add(:personaContactoDonacion,"No puede ser vacio para una ítem donado")
			end
		end
	    if adquisition_date != nil
		    if adquisition_date > Date.today
		    	errors.add(:adquisition_date,"no puede ser posterior a la fecha actual.")
		    end
		end
		if fechaDonacion
		    if fechaDonacion > Date.today
		    	errors.add(:fechaDonacion,"no puede ser posterior a la fecha actual.")
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
