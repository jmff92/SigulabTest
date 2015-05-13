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
