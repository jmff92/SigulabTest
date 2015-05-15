# encoding: utf-8
class Recommendation < ActiveRecord::Base
  
  ViaEnvio = ['Fax', 'Correo electrónico']
            
  validates_presence_of :codigo, :message => "de consulta de precios no puede estar en blanco" 
  validates_presence_of :via, :message => "por la cual se envió la carta de invitación no puede estar en blanco"
  
  belongs_to :user

end
