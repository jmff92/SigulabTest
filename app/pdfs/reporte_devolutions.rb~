# encoding: utf-8
class ReporteDevolutions < Prawn::Document

  def initialize(devolution) 
    super()
    @devolution = devolution
    header
    crear_tabla
    contenido
    pie_de_pagina
  end

  def header
	    #This inserts an image in the pdf file and sets the size of the image
	    image "#{Rails.root}/app/assets/images/coord.jpg", width: 180, height: 100, :position => 0
	    move_up 50
	    image "#{Rails.root}/app/assets/images/Logo_ULab.jpg", width: 50, height: 55, :position => 490  

	end

	def pie_de_pagina

			draw_text "Cod. Doc.: UL01-M01F09     Fecha: #{Time.now.strftime("%d-%m-%Y")}", :size => 6, :at => [1,20]
	    font("#{Prawn::DATADIR}/fonts/DejaVuSans.ttf") do 
	      font_size 8
	      text_box "Universidad Simón Bolívar, Edif. Energética, Planta Baja. Valle de Sartenejas, Baruta, " +
	                "Caracas, Edo. Miranda, Venezuela, 89000", :at => [20,11], :height => 8
	      font_size 7
	      text_box "Telef.: +58 212 906-3708 / 3709 / 3710 / 3711  Fax: +58 212 906-3712", :at => [150,0], :height => 7
	    end
	    
	end

	def crear_tabla
	   move_down 13

	   header = [[{:content => "NOTA DE DEVOLUCIÓN", :rowspan => 2, :width => 450, :size => 20, :background_color => "DDDDDD", :align => :center, :height => 20, :font_style => :bold},
			        {:content => "Registro No.", :background_color => "DDDDDD", :width => 90, :height => 18, :size => 9, :align => :center, :font_style => :bold}],
			        [{:content => "UL01/14-#{@devolution.numRegistro}", :background_color => "FFFFFF", :width => 90,:height => 18, :size => 9, :align => :center}],
			      	]

			cuerpo1 = [[{:width => 180, :height => 20},{:width => 180, :height => 20},{:width => 180, :height => 20}],
								 [{:width => 180, :height => 20},{:width => 180, :height => 20},{:width => 180, :height => 20}]
								]

			cuerpo2 = [[{:content => "UNIDAD SOLICITANTE", :align => :center, :size => 10, :height => 19, :font_style => :bold, :background_color => "959595", :width => 540}],
								 [{:content => "#{@devolution.unidadSolicitante}", :align => :center, :size => 10, :height => 19, :font_style => :bold, :background_color => "DDDDDD", :width => 540}],
								 [{:content => "CAUSA DE LA DEVOLUCIÓN", :align => :center, :size => 10, :height => 19, :font_style => :bold, :background_color => "959595", :width => 540}]
								]

			cuerpo3 = [[{:width => 290, :height => 180, :background_color => "DDDDDD"},{:content => "Carencia de Documentos:", :size => 10, :width => 250, :height => 180, :background_color => "DDDDDD"}]]

			cuerpo4 = [[{:content => "OBSERVACIONES", :align => :center, :background_color => "959595", :height => 19, :width => 380, :size => 10, :font_style => :bold},
								 	{:content => "Por la Coord. Adquisiciones:", :align => :center, :background_color => "959595", :height => 19, :width => 160, :size => 10, :font_style => :bold}]]

			cuerpo5 = [[{:content => "#{@devolution.observaciones}", :align => :left, :size => 11, :height => 80, :width => 380},
								 	{:align => :center, :height => 80, :width => 160}]]

	   table ([[header],[cuerpo1],[cuerpo2],[cuerpo3],[cuerpo4],[cuerpo5]])
	end

	def contenido

		draw_text "Requisición                    No.  #{@devolution.numRequisicion}", :size => 9, :at => [27,552]

		draw_text "Autorización de Pago     No.  #{@devolution.numAutorizacion}", :size => 9, :at => [207,552]

		draw_text "Certificación de servicio No.  #{@devolution.numCertificacion}", :size => 9, :at => [387,552]

		draw_text "Solicitud de servicio       No.  #{@devolution.numSolicitud}", :size => 9, :at => [27,534]

		draw_text "Informe de recepción     No.  #{@devolution.numInforme}", :size => 9, :at => [207,534]

		draw_text "Otro                                No.  #{@devolution.numOtro}", :size => 9, :at => [387,534]

		draw_text "Disponibilidad presupuestaria insuficiente", :size => 10, :at => [28,453]

		draw_text "Registro en idioma distinto al español", :size => 10, :at => [28,433]

		draw_text "Registro no discriminado por ítems", :size => 10, :at => [28,413]

		draw_text "Registro sin la firma y/o sello de la Unidad Responsable", :size => 10, :at => [28,393]

		draw_text "Carencia de información indispensable del proveedor", :size => 10, :at => [28,373]

		draw_text " del bien o servicio:", :size => 10, :at => [26,360]

		draw_text "Nombre", :at => [48,343], :size => 10

		draw_text "Dirección Fiscal", :at => [48,323], :size => 10

		draw_text "Datos Bancarios", :at => [48,303], :size => 10

		draw_text "RIF", :at => [148,343], :size => 10

		draw_text "Teléfonos", :at => [148,323], :size => 10

		draw_text "Persona Contacto", :at => [148,303], :size => 10

		draw_text "Otro", :at => [252,303], :size => 10

		draw_text "Contrato Fonacit, si aplica", :at => [318,434], :size => 10

		draw_text "Copia del Acta del Consejo Directo que autorice", :at => [318,414], :size => 10

		draw_text "la Contratación Pública (Compras mayores de", :at => [318,401], :size => 10

		draw_text "2.500 UT), si es aplicable", :at => [318,388], :size => 10

		draw_text "Factura, Proforma o Cotización  a nombre de la", :at => [318,368], :size => 10

		draw_text "USB, indicando  la condición de entrega.", :at => [318,355], :size => 10

		draw_text "Foto Referencial del Material y/o Equipo", :at => [318,335], :size => 10

		draw_text "solicitado", :at => [318,322], :size => 10

		draw_text "Fecha: #{Time.now.strftime("%d-%m-%Y")}", :size => 9, :at => [423,200]

		if @devolution.requisicion == true
			image "#{Rails.root}/app/assets/images/marcado.png", :width => 15, :height => 15, :at => [8,564]	
		else
			image "#{Rails.root}/app/assets/images/cuadrado.png", :width => 15, :height => 15, :at => [8,564]
		end

		if @devolution.autorizacion == true
			image "#{Rails.root}/app/assets/images/marcado.png", :width => 15, :height => 15, :at => [188,564]	
		else
			image "#{Rails.root}/app/assets/images/cuadrado.png", :width => 15, :height => 15, :at => [188,564]
		end

		if @devolution.certificacion == true
			image "#{Rails.root}/app/assets/images/marcado.png", :width => 15, :height => 15, :at => [368,564]	
		else
			image "#{Rails.root}/app/assets/images/cuadrado.png", :width => 15, :height => 15, :at => [368,564]
		end
		if @devolution.solicitud == true
			image "#{Rails.root}/app/assets/images/marcado.png", :width => 15, :height => 15, :at => [8,544]	
		else
			image "#{Rails.root}/app/assets/images/cuadrado.png", :width => 15, :height => 15, :at => [8,544]
		end

		if @devolution.informe == true
			image "#{Rails.root}/app/assets/images/marcado.png", :width => 15, :height => 15, :at => [188,544]	
		else
			image "#{Rails.root}/app/assets/images/cuadrado.png", :width => 15, :height => 15, :at => [188,544]
		end

		if @devolution.otro == true
			image "#{Rails.root}/app/assets/images/marcado.png", :width => 15, :height => 15, :at => [368,544]	
		else
			image "#{Rails.root}/app/assets/images/cuadrado.png", :width => 15, :height => 15, :at => [368,544]
		end

		##################################

		if @devolution.disponibilidad == true
			image "#{Rails.root}/app/assets/images/marcado.png", :width => 15, :height => 15, :at => [8,464]	
		else
			image "#{Rails.root}/app/assets/images/cuadrado.png", :width => 15, :height => 15, :at => [8,464]
		end

		if @devolution.idioma == true
			image "#{Rails.root}/app/assets/images/marcado.png", :width => 15, :height => 15, :at => [8,444]	
		else
			image "#{Rails.root}/app/assets/images/cuadrado.png", :width => 15, :height => 15, :at => [8,444]
		end

		if @devolution.discriminado == true
			image "#{Rails.root}/app/assets/images/marcado.png", :width => 15, :height => 15, :at => [8,424]	
		else
			image "#{Rails.root}/app/assets/images/cuadrado.png", :width => 15, :height => 15, :at => [8,424]
		end

		if @devolution.firma == true
			image "#{Rails.root}/app/assets/images/marcado.png", :width => 15, :height => 15, :at => [8,404]	
		else
			image "#{Rails.root}/app/assets/images/cuadrado.png", :width => 15, :height => 15, :at => [8,404]
		end

		if @devolution.carencia == true
			image "#{Rails.root}/app/assets/images/marcado.png", :width => 15, :height => 15, :at => [8,384]	
		else
			image "#{Rails.root}/app/assets/images/cuadrado.png", :width => 15, :height => 15, :at => [8,384]
		end

		if @devolution.nombre == true
			image "#{Rails.root}/app/assets/images/marcado.png", :width => 15, :height => 15, :at => [28,354]	
		else
			image "#{Rails.root}/app/assets/images/cuadrado.png", :width => 15, :height => 15, :at => [28,354]
		end

		if @devolution.direccion == true
			image "#{Rails.root}/app/assets/images/marcado.png", :width => 15, :height => 15, :at => [28,334]	
		else
			image "#{Rails.root}/app/assets/images/cuadrado.png", :width => 15, :height => 15, :at => [28,334]
		end

		if @devolution.datos == true
			image "#{Rails.root}/app/assets/images/marcado.png", :width => 15, :height => 15, :at => [28,314]	
		else
			image "#{Rails.root}/app/assets/images/cuadrado.png", :width => 15, :height => 15, :at => [28,314]
		end

		if @devolution.rif == true
			image "#{Rails.root}/app/assets/images/marcado.png", :width => 15, :height => 15, :at => [128,354]	
		else
			image "#{Rails.root}/app/assets/images/cuadrado.png", :width => 15, :height => 15, :at => [128,354]
		end

		if @devolution.telefonos == true
			image "#{Rails.root}/app/assets/images/marcado.png", :width => 15, :height => 15, :at => [128,334]	
		else
			image "#{Rails.root}/app/assets/images/cuadrado.png", :width => 15, :height => 15, :at => [128,334]
		end

		if @devolution.persona == true
			image "#{Rails.root}/app/assets/images/marcado.png", :width => 15, :height => 15, :at => [128,314]	
		else
			image "#{Rails.root}/app/assets/images/cuadrado.png", :width => 15, :height => 15, :at => [128,314]
		end

		if @devolution.otroCarencia == true
			image "#{Rails.root}/app/assets/images/marcado.png", :width => 15, :height => 15, :at => [228,314]	
		else
			image "#{Rails.root}/app/assets/images/cuadrado.png", :width => 15, :height => 15, :at => [232,314]
		end

		if @devolution.contacto == true
			image "#{Rails.root}/app/assets/images/marcado.png", :width => 15, :height => 15, :at => [298,444]	
		else
			image "#{Rails.root}/app/assets/images/cuadrado.png", :width => 15, :height => 15, :at => [298,444]
		end

		if @devolution.copia == true
			image "#{Rails.root}/app/assets/images/marcado.png", :width => 15, :height => 15, :at => [298,424]	
		else
			image "#{Rails.root}/app/assets/images/cuadrado.png", :width => 15, :height => 15, :at => [298,424]
		end

		if @devolution.factura == true
			image "#{Rails.root}/app/assets/images/marcado.png", :width => 15, :height => 15, :at => [298,378]	
		else
			image "#{Rails.root}/app/assets/images/cuadrado.png", :width => 15, :height => 15, :at => [298,378]
		end

		if @devolution.foto == true
			image "#{Rails.root}/app/assets/images/marcado.png", :width => 15, :height => 15, :at => [298,345]	
		else
			image "#{Rails.root}/app/assets/images/cuadrado.png", :width => 15, :height => 15, :at => [298,345]
		end

	end

end