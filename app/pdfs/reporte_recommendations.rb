# encoding: utf-8
class ReporteRecommendations < Prawn::Document

  def initialize(recommendation, empresas, empresas_todas, itemsquote,fecha)
	 print "INIT OK "
    super()
    @recommendation = recommendation
    @empresas = empresas
    @empresas2 = empresas.sort {|a,b| a.opcion_numero <=> b.opcion_numero}
    @empresas_todas = empresas_todas
    @fecha = fecha
    @itemsquote = itemsquote
   repeat :all do
    header
   end
    titulo
    encabezado
    texto
    pie_de_pagina
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
      [[{:content => "Informe de recomendación", :rowspan => 2, :size => 15, :background_color => "DDDDDD", :align => :center, :height => 20},
        {:content => "Registro:", :background_color => "DDDDDD", :height => 18, :size => 9, :align => :center}],
        [{:content => "000#{@recommendation.id}", :background_color => "FFFFFF",:height => 18, :size => 9, :align => :center}]]

    
  end

  def encabezado
    bounding_box([bounds.right - 130,bounds.top - 170], :width => bounds.width) do
      text "Sartenejas, #{Time.now.strftime("%d-%m-%Y")}"
    end
  end

  def texto
    time = @fecha.created_at
    time2 = time + + 7.days

    bounding_box([bounds.left,bounds.top - 190], :width => bounds.width, :height => 450) do
      text"Por medio del presente rindo el informe de recomendación correspondiente al procedimiento de la Especificación Técnica #{@recommendation.codigo}, conforme al tenor descrito a continuación:", :align => :justify, :indent_paragraphs => 40, :inline_format => true

      move_down 7
      text "1. Cumpliendo con el Artículo 7 del Reglamento de la Ley de Contrataciones Públicas, el día #{time.strftime("%d-%m-%Y")} se procedió a la remisión, vía #{@recommendation.via}, de la “Carta de Invitación” y las “Especificaciones Técnicas del Bien” a las empresas que se mencionan a continuación, para que participasen en el proceso de contratación", :align => :justify, :indent_paragraphs => 40



       empresas_all = ""
       @empresas_todas.each do |nombre|
	        empresas_all = empresas_all + ", " + nombre.nombre
       end
       empresas_all = empresas_all[1..-1]
       move_down 12
       text empresas_all, :align => :justify, :indent_paragraphs => 50

       move_down 12
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

       move_down 12
       text empresas_all, :align => :justify, :indent_paragraphs => 40

       move_down 12
       text "4. El día #{time2.strftime("%d-%m-%Y")} se procedió a evaluar las ofertas calificadas, aplicando los criterios de evaluación estipulados en la “Carta de Invitación”.", :align => :justify, :indent_paragraphs => 40

       move_down 7
       text "Una vez evaluadas las ofertas en cuestión y cumpliendo con lo estipulado en el articulo 118 del Reglamento de la Ley de Contrataciones Públicas, se recomienda formalizar la(s) adjudicación(es) como se describe a continuación:",
       :align => :justify,:indent_paragraphs => 40, :inline_format => true
       move_down 12
   
       @empresas2.each do |emp|
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

      move_down 15
      text " Atentamente,\n", :align => :justify, :indent_paragraphs => 40
      bounding_box [bounds.left, bounds.bottom], :width => bounds.width do
      text "______________________________", :size => 8
      text "#{@recommendation.responsale}", :size => 8
      end
      bounding_box [bounds.left, bounds.bottom], :width => bounds.width do
      text "______________________________\nCoordinador(a) de Adquisiciones", :size => 8, :align => :center
      end
      bounding_box [bounds.right - 130, bounds.bottom], :width => bounds.width do
      text "______________________________", :size =>8
      text "Jefe del Laboratorio", :size => 8
      end
   
    end
  end

  def pie_de_pagina
    bounding_box [bounds.left, bounds.bottom + 50], :width => bounds.width do
      font("#{Prawn::DATADIR}/fonts/DejaVuSans.ttf") do
        font_size 8
        text "Universidad Simón Bolívar, Edif. Energética, Planta Baja. Valle de Sartenejas, Baruta,\n " +
                "Caracas, Edo. Miranda, Venezuela, 89000", :height => 8, :align => :center
        font_size 7
        text "Telef.: +58 212 906-3708 / 3709 / 3710 / 3711  Fax: +58 212 906-3712", :height => 7, :align => :center

        font_size 6
        text "Cod. Doc: UL01-M01F04    Fecha: 15/05/2014", :size => 6, :align => :left
      end
    end
  end
 
end
