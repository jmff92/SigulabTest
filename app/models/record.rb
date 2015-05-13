class Record < ActiveRecord::Base
	validates_presence_of :fecha
	validates_presence_of :nos
	validates_presence_of :tipoServicio
	validates_presence_of :descripcion
	validates_presence_of :fechaini
	validates_presence_of :fechafin
end
