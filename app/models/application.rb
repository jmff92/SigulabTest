class Application < ActiveRecord::Base
	validates_presence_of :descripcion, :presence => {:message => "no puede ser blanco"}
	validates_presence_of :fechaRequerida, :presence => {:message => "no puede ser blanco"}
	validates_presence_of :uso, :presence => {:message => "no puede ser blanco"}
end
