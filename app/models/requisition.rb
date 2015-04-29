class Requisition < ActiveRecord::Base
	validates_presence_of :solicitante
	validates_presence_of :consumidor
	validates_presence_of :partida
	validates_presence_of :autor
	belongs_to :user
end
