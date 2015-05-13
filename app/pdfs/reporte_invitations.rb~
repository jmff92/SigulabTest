# encoding: utf-8
class ReporteInvitations < Prawn::Document

  def initialize(invitation) 
	 print "INIT OK "
    super()
    @invitation = invitation
    header
    titulo
    encabezado
    info
    texto
    pie_de_pagina
  end

  def header
      #This inserts an image in the pdf file and sets the size of the image
      image "#{Rails.root}/app/assets/images/coord.jpg", width: 180, height: 100, :position => 0
      move_up 50
      image "#{Rails.root}/app/assets/images/Logo_ULab.jpg", width: 50, height: 55, :position => 490  

  end

  def titulo
   move_down 13
   table tittle do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD','DDDDDD']
      self.column_widths = [450,90]
    end
  end

 def tittle 
      [[{:content => "Carta de Invitación", :rowspan => 2, :size => 15, :background_color => "DDDDDD", :align => :center, :height => 20},
        {:content => "Registro:", :background_color => "DDDDDD", :height => 18, :size => 9, :align => :center}],
        [{:content => "#{@invitation.id}", :background_color => "FFFFFF",:height => 18, :size => 9, :align => :center}]]

    
  end

  def encabezado
 	 draw_text "Sartenejas, #{Time.now.strftime("%d-%m-%Y")}", :at => [415, 545]
  end

  def info 
    move_down 20
    if @invitation.rif != "N/A"
  	 text "#{@invitation.nombre} (Rif: #{@invitation.rif})"
    else
  	text "#{@invitation.nombre}"
    end

    text "#{@invitation.direccion}"
    text "Presente.-"
  end

  def texto
    time = Time.now + 7.days
    move_down 10
    text"Para dar cumplimiento con lo establecido en el articulo 73 con Rango, Valor y Fuerza de Ley de Contrataciones Públicas (Gaceta Nº 				39.503 de Fecha 06 de septiembre 2010), referente al Procedimiento por <u><b>Consulta de Precios</b></u> hasta 2.500 U.T. para bienes, ó 5.000 U.T. 				para servicios, en concordancia con los artículos 109 y 113 del Reglamento de Ley de Contrataciones Públicas (Gaceta oficial 39.181 			de fecha 19 de Mayo 2009), tenemos el agrado de dirigirnos a ustedes, en la oportunidad de solicitar una oferta, la cual debe 			contener la siguiente información:", :align => :justify, :indent_paragraphs => 40, :inline_format => true

#445

    text_box "• Especificaciones Técnicas", :at => [0, 400]
    text_box "• Monto de la Oferta", :at => [0, 385]
    text_box "• Modalidad de pago", :at => [0, 370]
    text_box "• Garantía", :at => [0, 355]     
	  text_box "• Tiempo de entrega",:at => [160, 400]
    text_box "• Validez de la oferta", :at => [160, 385]
    text_box "• Domicilio Principal ",:at => [160, 370]
    text_box " (Dirección de la Empresa)",:at => [168,355]
    text_box "• Constancia de Inscripción en el Registro" , :at => [317, 400]
    text_box "  de Proveedores Interno USB.", :at => [323,385]
    text_box "• Valor Agregado Nacional (Art. 9 de " ,:at => [317, 370]
    text_box "la Ley de Contrataciones Públicas).", :at => [323,355]
    stroke do
    	vertical_line 400, 345, :at => 153
      vertical_line 400, 345, :at => 312
      
    end

    move_down 80
    text " La oferta deberá ser enviada por fax al número: #{@invitation.telefono} o correo electrónico #{@invitation.correo} sellado y 				firmado por la empresa participante. De igual manera, le informamos que se recibirán ofertas hasta el día #{time.strftime("%d-%m-%Y")}", :align => :justify, :indent_paragraphs => 40

   move_down 5
   text "Para efectos de la oferta enviada por su Empresa, será aplicado el Articulo 118 del Reglamento de la Ley de Contrataciones Públicas: 				“<u>Los órganos o entes contratantes, adjudicaran preferentemente bajo esta modalidad a empresas pequeñas, y medianas industrias o 				cualquier otra forma asociativa productiva comunitaria, todas natural de la localidad o ubicadas en el lugar donde se ejecutará la 				contratación.</u>” ", :align => :justify, :indent_paragraphs => 40,:inline_format => true 
   move_down 5
   text "Una vez recibidas las ofertas de los participantes invitados, se realizará la evaluación de las mismas tomando como criterios de 			evaluación los siguientes términos: 1) Tiempo de entrega, 2) Garantía, 3) Precio de la Oferta, 4) Validez de la Oferta, 					5)Especificaciones Técnicas del Bien.", :align => :justify, :indent_paragraphs => 40

   move_down 5
   text "Una vez realizado el Proceso de consulta de precios, la Coordinación de Adquisiciones de la ULab “<u>notificará a todos los oferentes 		del resultado mediante el cual se ponga fin al procedimiento</u>”, de acuerdo al artículo 91 de la Ley de Contrataciones Públicas.", 
   :align => :justify,:indent_paragraphs => 40, :inline_format => true
   
	move_down 5
   text "Para cualquier información adicional comunicarse a #{@invitation.telefono_Adicional} ", :align => :justify, :indent_paragraphs => 40

   move_down 5
   text "Agradeciendo su receptividad y respuesta a esta solicitud, se despide de usted.", :align => :justify,:indent_paragraphs => 40

   move_down 5
   text " Atentamente,", :align => :center

   stroke do
   	horizontal_line 210, 340, :at => 45
		horizontal_line 395, 525, :at => 25
   end

   draw_text "#{@invitation.responsable}", :at => [235,32]
   draw_text "Recibido por", :at => [435,60], :size => 8
   draw_text "Cod. Doc.: UL01-M01F03     Fecha: 03/01/2014", :size => 6, :at => [10,20]
   
 
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
