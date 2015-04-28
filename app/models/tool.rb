require "unicode_utils"
class Tool < ActiveRecord::Base
	validates :name, :presence => {:message => "no puede ser blanco"}
	validates :national_good, :uniqueness => {:message => "ya existe otra herramienta con el mismo numero de bien nacional"}
	validates :location, :presence => {:message => "no puede ser blanco"}
	validates :dependency, :presence => {:message => "no puede ser blanco"}
	validates :responsible, :presence => {:message => "no puede ser blanco"}
	before_save :uppercase_fields
	before_update :uppercase_fields
	has_many :table_items_solicitud

	def self.search
		query=UnicodeUtils.upcase(query, :es)
		where("name like ?", "%#{query}%") 
	end
	
	private
	def uppercase_fields
		self.name=UnicodeUtils.upcase(self.name, :es)
		self.brand=UnicodeUtils.upcase(self.brand, :es)
		self.tipo=UnicodeUtils.upcase(self.tipo, :es)
		self.status=UnicodeUtils.upcase(self.status, :es)
		self.responsible=UnicodeUtils.upcase(self.responsible, :es)
		self.location=UnicodeUtils.upcase(self.location, :es)
		self.material=UnicodeUtils.upcase(self.material, :es)
		self.bill=UnicodeUtils.upcase(self.bill, :es)
		self.buy_order=UnicodeUtils.upcase(self.buy_order, :es)
		self.dependency=UnicodeUtils.upcase(self.dependency, :es)
	end
end
