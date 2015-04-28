# encoding: utf-8
class ReporteRecommendations < Prawn::Document

  def initialize(recommendation, empresas, empresas_todas, itemsquote) 
	 print "INIT OK "
    super()
    @recommendation = recommendation
    @empresas = empresas
    @empresas_todas = empresas_todas
    @itemsquote = itemsquote
    header
    titulo
    encabezado
    texto
    pie_de_pagina
  end

  def header
      #This inserts an image in the pdf file and sets the size of the image
      image "#{Rails.root}/app/assets/images/coord.jpg", width: 180, height: 90, :position => 0
      move_up 50
      image "#{Rails.root}/app/assets/images/Logo_ULab.jpg", width: 50, height: 55, :position => 490  

  end

  def titulo
   move_down 34
   table tittle do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD','DDDDDD']
      self.column_widths = [450,90]
    end
  end

 def tittle 
      [[{:content => "Informe de recomendación", :rowspan => 2, :size => 15, :background_color => "DDDDDD", :align => :center, :height => 20},
        {:content => "Registro:", :background_color => "DDDDDD", :height => 18, :size => 9, :align => :center}],
        [{:content => "000#{@recommendation.id}", :background_color => "FFFFFF",:height => 18, :size => 9, :align => :center}]]

    
  end

  def encabezado

  end

  def texto
    time = Time.now + 7.days
    move_down 15
    text"Por medio del presente rindo el informe de recomendación correspondiente al procedimiento de la Especificación Técnica #{@recommendation.codigo}, conforme al tenor descrito a continuación:", :align => :justify, :indent_paragraphs => 40, :inline_format => true

    move_down 10
    text "1. Cumpliendo con el Artículo 7 del Reglamento de la Ley de Contrataciones Públicas, se procedió a la remisión, vía #{@recommendation.via}, de la “Carta de Invitación” y las “Especificaciones Técnicas del Bien” a las empresas que se mencionan a continuación, para que participasen en el proceso de contratación", :align => :justify, :indent_paragraphs => 40

    empresas_all = ""
    @empresas_todas.each do |nombre|
	empresas_all = empresas_all + ", " + nombre.nombre
    end 
    empresas_all = empresas_all[1..-1]

   move_down 5
   text empresas_all, :align => :justify, :indent_paragraphs => 50

   move_down 7
   text "2. Se recibieron las ofertas de las empresas interesadas a participar en el proceso antes mencionado.", :align => :justify, :indent_paragraphs => 40

   move_down 7
   text "3. Se verificó la conformidad de cada una de las ofertas recibidas con los requisitos legales, técnicos y financieros, calificando para evaluación las correspondientes a las siguientes empresas:” ", :align => :justify, :indent_paragraphs => 40

    empresas_all = ""
    @empresas.each do |emp|
	if emp.cumplio_req == 1
		empresas_all = empresas_all + ", " + emp.empresa
	end
    end
    empresas_all = empresas_all[1..-1]

   move_down 5
   text empresas_all, :align => :justify, :indent_paragraphs => 40

   move_down 7
   text "4. El día #{time.strftime("%d-%m-%Y")} se procedió a evaluar las ofertas calificadas, aplicando los criterios de evaluación estipulados en la “Carta de Invitación”.", :align => :justify, :indent_paragraphs => 40

   move_down 7
   text "Una vez evaluadas las ofertas en cuestión y cumpliendo con lo estipulado en el articulo 118 del Reglamento de la Ley de Contrataciones Públicas, se recomienda formalizar la(s) adjudicación(es) como se describe a continuación:", 
   :align => :justify,:indent_paragraphs => 40, :inline_format => true
   
    @empresas.each do |emp|
	if emp.cumplio_req == 1
		case emp.opcion_numero
		when 1
		  opc_nombre = "PRIMERA OPCIÓN"
		when 2
		  opc_nombre = "SEGUNDA OPCIÓN"
		when 3
		  opc_nombre = "TERCERA OPCIÓN"
		when 4
		  opc_nombre = "CUARTA OPCIÓN"
		when 5
		  opc_nombre = "QUINTA OPCIÓN"
		when 6
		  opc_nombre = "SEXTA OPCIÓN"
		when 7
		  opc_nombre = "SÉPTIMA OPCIÓN"
		else
		  opc_nombre = "OPCIÓN"
		end
		itemsof = ""
		@itemsquote.each do |item|
			if item.id_oferta == emp.quote_id and item.compra == 1
				itemsof = itemsof +item.nombre_item + ", "
			end
		end 
  		itemsof = itemsof[0..-2]

		cuali = ""
		if emp.calidad_pro == 1 
			cuali = cuali + "Calidad del producto, "
		end
		if emp.disponibilidad_pro == 1 
			cuali = cuali + "Disponibilidad del producto, "
		end
		if emp.proveedor_unico == 1 
			cuali = cuali + "Proovedor Único, "
		end
		if emp.calidad_ser == 1 
			cuali = cuali + "Calidad del servicio, "
		end
		if emp.garantia == 1 
			cuali = cuali + "Garantía, "
		end
		if emp.servicio_post == 1 
			cuali = cuali + "Servicio post-venta, "
		end
		if emp.cumplimiento_esp == 1 
			cuali = cuali + "Cumplimiento de las especificaciones, "
		end
		if emp.precio == 1 
			cuali = cuali + "Precio, "
		end
		if emp.tiempo == 1 
			cuali = cuali + "Tiempo, "
		end
		cuali = cuali[0..-3]
		move_down 6
   		text "• #{opc_nombre}: #{emp.empresa}, para los items: #{itemsof} de acuerdo a los siguientes criterios:", :align => :justify, :indent_paragraphs => 40
		move_down 2
   		text "#{cuali}", :align => :justify, :indent_paragraphs => 50		
	end
    end


	

   move_down 5
   text "Agradeciendo su receptividad y respuesta a esta solicitud, se despide de usted.", :align => :justify,:indent_paragraphs => 40

   move_down 5
   text " Atentamente,\n\n\n\n#{@recommendation.responsale}", :align => :center

   stroke do

   	horizontal_line 210, 340, :at => 54
		horizontal_line 395, 525, :at => 54
   end
   draw_text "Coordinador(a) de Adquisiciones", :at => [218,40], :size => 8
   draw_text "Jefe del Laboratorio", :at => [431,40], :size => 8
   draw_text "Cod. Doc: UL01-M01F04    Fecha: 15/05/2014", :size => 6, :at => [10,20]
   
 
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
