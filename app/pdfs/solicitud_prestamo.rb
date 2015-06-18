# encoding: utf-8
class SolicitudPrestamo < Prawn::Document

def initialize(parametro,prestamo)
		super()
		@parametro = parametro
    @loan = prestamo
		repeat :all do
			header
			pie_de_pagina
		end
  	titulo
    table_content
  end
 
  def header
    #This inserts an image in the pdf file and sets the size of the image
    image "#{Rails.root}/app/assets/images/coord.jpg", width: 180, height: 100, :position => 0
    move_up 50
    image "#{Rails.root}/app/assets/images/Logo_ULab.jpg", width: 50, height: 55, :position => 490
    

  end

  def titulo
   move_down 35
   table tittle do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD','DDDDDD']
      self.column_widths = [450,90]
    end
end

   def tittle 
      [[{:content => "Solicitud De Prestamos", :rowspan => 2, :size => 20, :background_color => "DDDDDD"  },
        {:content => "Registro No.", :background_color => "DDDDDD"}],
        [{:content => "00#{@loan.id}", :background_color => "FFFFFF", :align => :center}]]
   end


  def table_content 
    move_down 25
    # Then I set the table column widths
    table equipos_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [80,120,170,100,70]
    end
  end
 
  def equipos_rows
    [['ID-Ítem','Nombre del Bien']] + 
    @parametro.map do |parametro|
      [parametro.id2, parametro.name.upcase]
    end
end

  def pie_de_pagina
      font_size 8
      text_box "Universidad Simón Bolívar, Edif. Energética, Planta Baja. Valle de Sartenejas, Baruta, " +
                "Caracas, Edo. Miranda, Venezuela, 89000", :at => [20,11], :height => 8
      font_size 7
      text_box "Telef.: +58 212 906-3708 / 3709 / 3710 / 3711  Fax: +58 212 906-3712", :at => [150,0], :height => 7
end
end