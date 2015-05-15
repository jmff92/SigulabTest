# encoding: utf-8
class ReporteItems < Prawn::Document

  def initialize(items,spec) 
    super()
    @items = items
    @spec = spec
      repeat :all do
        header
        pie_de_pagina
      end
      titulo
      table_content
  end
 
  def header
    bounding_box([bounds.left,bounds.top], :width => bounds.width) do
      #This inserts an image in the pdf file and sets the size of the image
      image "#{Rails.root}/app/assets/images/coord.jpg", width: 180, height: 90, :position => 0
      move_up 50
      image "#{Rails.root}/app/assets/images/Logo_ULab.jpg", width: 50, height: 55, :position => 490
    end
  end

  def titulo
    bounding_box([bounds.left,bounds.top - 120], :width => bounds.width) do
      table tittle do
        row(0).font_style = :bold
        self.header = true
        self.row_colors = ['DDDDDD','DDDDDD']
        self.column_widths = [450,90]
      end
    end
  end

   def tittle 
      [[{:content => "ESPECIFICACIONES TÉCNICAS DE BIENES", :rowspan => 2, :size => 20, :background_color => "DDDDDD" , :align => :center, :valign => :center  },
        {:content => "Registro No.", :background_color => "DDDDDD"}],
        [{:content => "#{@spec.id}", :background_color => "FFFFFF", :align => :center}]]
   end


  def table_content

    bounding_box([bounds.left,bounds.top - 200], :width => bounds.width, :height => 450) do
      # Creamos la tabla.
      table (items_rows) do

        header = true
          row(0).font_style = :bold
          columns(0..3).align = :center
          columns(0..3).valign = :center
          self.header = true
          self.row_colors = ['DDDDDD', 'FFFFFF']
          self.column_widths = [80,120,240,100]
      end
      text "\n\n\n______________________\nFirma de Autorizacion\ \ \ \ ", :align => :right
    end

  end
 
  def items_rows

    [['Número de Item','Nombre','Descripción','Cantidad']] +
      @items.map do |item|

      [item.id, item.nombre.upcase, item.descripcion.upcase, item.cantidad]
    end
  end

  def pie_de_pagina
    bounding_box [bounds.left, bounds.bottom + 50], :width => bounds.width do
      font("#{Prawn::DATADIR}/fonts/DejaVuSans.ttf") do
        font_size 8
        text "Universidad Simón Bolívar, Edif. Energética, Planta Baja. Valle de Sartenejas, Baruta,\n" +
                "Caracas, Edo. Miranda, Venezuela, 89000", :height => 8, :align => :center
        font_size 7
        text "Telef.: +58 212 906-3708 / 3709 / 3710 / 3711  Fax: +58 212 906-3712", :height => 7, :align => :center
      end
    end
  end

end

