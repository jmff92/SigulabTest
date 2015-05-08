class Servicerequest < ActiveRecord::Base

    DeOpc = ["Coordinacion de Adquisiciones", "Coordinacion de Importaciones", "Coordinacion de la Calidad", "Unidad Administrativa", "Direccion ULAB", "Laboratorio A", "Laboratorio B", "Laboratorio C", "Laboratorio D", "Laboratorio E", "Laboratorio F", "Laboratorio G"]
	belongs_to :user
end
