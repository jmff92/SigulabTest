require "unicode_utils"
class Consumable < ActiveRecord::Base
	validates :name, :presence => {:message => "no puede ser blanco"}
	validates :dependency, :presence => {:message => "no puede ser blanco"}
	validates :location, :presence => {:message => "no puede ser blanco"}
	validates :responsible, :presence => {:message => "no puede ser blanco"}
	has_many :table_items_solicitud
	attr_localized :cost
	validates :cost, numericality: { greater_than: 0 }, if: "!cost.blank?"
	
	def self.search(query)
		query=UnicodeUtils.upcase(query, :es)
		where("name like ?", "%#{query}%") 
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
