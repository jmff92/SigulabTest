class Specification < ActiveRecord::Base
        Tipo = ['Bienes', 'Servicios']
        Compra = ['Nacional', 'Internacional']
        Importacion = ['Con exoneracion de impuestos de importacion y con exoneracion del I.V.A.', 'Cancelando el monto correspondiente al Impuesto de Importacion y con exoneracion del I.V.A.', 'Cancelando los montos correspondientes al Impuesto de Importacion y el I.V.A.']       
  
  
        belongs_to :user
        has_many :acts
end
