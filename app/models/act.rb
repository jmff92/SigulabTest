class Act < ActiveRecord::Base
   
	validates_presence_of :proveedor
	validates_presence_of :justificacion
	validates_presence_of :providencia

   belongs_to :user
   belongs_to :specification
end
