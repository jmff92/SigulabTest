# encoding: utf-8
class ReporteRequests < Prawn::Document

  def initialize(request, sid, data) 
    super()
    @request = request
    @sid = sid
    @data = data
    header
    repeat :all do
      pie_de_pagina
    end
    titulo
    titulo2
    titulo3
    titulo4
    titulo5
    #table_content
  end
 
  def header
      #This inserts an image in the pdf file and sets the size of the image
      image "#{Rails.root}/app/assets/images/coord.jpg", width: 180, height: 90, :position => 0
      move_up 50
      image "#{Rails.root}/app/assets/images/Logo_ULab.jpg", width: 50, height: 55, :position => 490  

  end

  def titulo
    move_down 35
      table tittle do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD','DDDDDD']
      self.column_widths = [455,85]

    end
   end

   def tittle 
      [[{:content => "SOLICITUD DE COMPRA A PROVEEDOR EN EL EXTRANJERO", :rowspan => 2, :size => 20, :background_color => "DDDDDD",
 																																				:align => :center },
        {:content => "Registro No.", :background_color => "DDDDDD"}],
        [{:content => "#{@sid.id}", :background_color => "FFFFFF", :align => :center}]]
   end

  def titulo2
    move_down 20
      table tittle2 do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD','DDDDDD']
      self.column_widths = [540]
    end
   end

   def tittle2
      [[{:content => "Unidad Solicitante", :background_color => "DDDDDD", :align => :center}],
        [{:content => "#{@request.unidad_solicitante}", :background_color => "FFFFFF", :align => :center}]]
   end
     def titulo3
    move_down 0
      table tittle3 do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD','DDDDDD']
      self.column_widths = [180,180,180]
    end
   end

   def tittle3
      [[{:content => "Persona Contacto", :background_color => "DDDDDD", :align => :center},{:content => "Teléfono", :background_color => "DDDDDD", :align => :center},
{:content => "E-mail", :background_color => "DDDDDD", :align => :center}],
        [{:content => "#{@request.persona_contacto}", :background_color => "FFFFFF", :align => :center},{:content => "#{@request.telefono}", :background_color => "FFFFFF", :align => :center},{:content => "#{@request.email}", :background_color => "FFFFFF", :align => :center}]]
   end
  def titulo4
    move_down 4
      table tittle4 do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD','DDDDDD']
      self.column_widths = [540]
    end
   end

   def tittle4
      [[{:content => "Solicitud de Servicio", :background_color => "DDDDDD", :align => :center}],
        [{:content => "Yo, #{@request.persona_contacto}, por medio de la presente solicito los servicios de la Unidad de Laboratorios, a través de su Coord. de Importaciones, para la tramitación de la adquisición de divisas, ante el CENCOEX; #{@sid.modalidad}; y, la nacionalización correspondiente a la compra de el (los) equipo(s)/material(es), conforme lo establece el Instructivo Solicitud de Compra a Proveedor en el Extranjero, emitido por dicha Coordinación. El (los) equipo(s)/material(es) serán adquiridos con fondos provenientes de:\n\n#{@data}\n\nPor otra parte, hago constar que estoy en el conocimiento de que esta solicitud no será procesada, y me será devuelta, en caso de no consignar toda la documentación que abajo se especifica; a la vez que me hago responsable por que la información contenida en la misma esté completa y correcta, a fin de procurar que el proceso de compra sea lo más expedito posible en lo que de mi parte corresponde. 
Así mismo, dejo constancia de estar en conocimiento que, una vez efectuada la compra, los materiales/equipos adquiridos pasan automáticamente a ser propiedad de la Universidad Simón Bolívar.\n\n_______________________\nFirma", :background_color => "FFFFFF", :align => :justify}]]
   end

def titulo5
    move_down 4
      table tittle5 do
      row(0).font_style = :bold
	row(2).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD','DDDDDD']
      self.column_widths = [400,140]
    end
   end

   def tittle5
      [[{:content => "Documentos a Consignar", :background_color => "DDDDDD", :align=> :center},
        {:content => " ", :background_color => "DDDDDD", :align=> :center}],
        [{:content => "• Proforma a nombre de la UNIVERSIDAD SIMON BOLIVAR, indicando  la condición de entrega, de acuerdo a lo establecido en numeral 2.5 del instructivo de “Solicitud de Compra a Proveedor en el Extranjero”\n\n• Comunicación oficial emitida por el Proveedor que incluya sus datos generales e información Bancaria, según lo establecido en el punto 3 del Instructivo de “Solicitud de Compra a Proveedor en el Extranjero” 	\n\n• Requisición de Materiales y Equipos detallados en español (pto. 4 del instructivo) 	\n\n• Folleto o catálogo (Brochure) del Material y/o Equipo solicitado, que respalde la información suministrada en el formato de “Relación Descriptiva de Materiales/Equipos” 	\n\n• Instructivo de “Solicitud de Compra a Proveedor en el Extranjero” firmado y sellado. 	\n\n• Copia Contrato Fonacit, si aplica	\n\n• Copia del Consejo Directo donde autorice la Contratación Pública, si aplica (Compras mayores de 2.500 UT)", :background_color => "FFFFFF", :align => :left}, {:content => "Recibido por:\n\n\n\nCoordinación de Adquisiciones – ULab.\nFecha:\n\n\n\n\n\n\n\n\n\nAprobado por:\n\n\n\n\nDirector – ULab.\nFecha:", :background_color => "FFFFFF", :align => :center}]]
   end


  def pie_de_pagina
    font("#{Prawn::DATADIR}/fonts/DejaVuSans.ttf") do 
      font_size 8
      text_box "Universidad Simón Bolívar, Edif. Energética, Planta Baja. Valle de Sartenejas, Baruta, " +
                "Caracas, Edo. Miranda, Venezuela, 89000", :at => [20,11], :height => 8
      font_size 7
      text_box "Telef.: +58 212 906-3708 / 3709 / 3710 / 3711  Fax: +58 212 906-3712", :at => [150,0], :height => 7
    end
    
  end

end
