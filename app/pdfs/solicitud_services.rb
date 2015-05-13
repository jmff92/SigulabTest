# encoding: utf-8
class SolicitudServices < Prawn::Document

  def initialize (servicerequest, empresa, items,quote)
    print "INIT OK"
    @servicerequest = servicerequest
    @empresa = empresa
    @items = items
    @cotizacion = quote
    super()
    encabezado
    pie_de_pagina
    titulo
    datos_de_solicitud
  end

  def encabezado
    bounding_box([bounds.left,bounds.top], :width => bounds.width) do
      #This inserts an image in the pdf file and sets the size of the image
      image "#{Rails.root}/app/assets/images/coord.jpg", width: 180, height: 90, :position => 0
      move_up 50
      image "#{Rails.root}/app/assets/images/Logo_ULab.jpg", width: 50, height: 55, :position => 490
    end
  end

  def pie_de_pagina
    bounding_box [bounds.left, bounds.bottom + 30], :width => bounds.width do
      font("#{Prawn::DATADIR}/fonts/DejaVuSans.ttf") do
        font_size 6
        text "Cod. Doc: UL01-M01F06    Fecha: 09/04/2015", :size => 6, :align => :left
      end
    end
  end

  def titulo
    bounding_box([bounds.left,bounds.top - 120], :width => bounds.width) do
      table info_titulo do
        row(0).font_style = :bold
        self.header = true
        self.row_colors = ['DDDDDD','DDDDDD']
        self.column_widths = [450,90]
      end
    end
  end

    def info_titulo
      [[{:content => "SOLICITUD DE SERVICIO", :rowspan => 2, :size => 20, :background_color => "DDDDDD" , :align => :center, :valign => :center  },
        {:content => "Registro No.", :background_color => "DDDDDD"}],
       [{:content => "1", :background_color => "FFFFFF", :align => :center}]]
    end

  def datos_de_solicitud
    bounding_box([bounds.left,bounds.top - 180], :width => bounds.width) do
      table info_solicitud do
          
          row(0).font_style = :bold
          self.column_widths = [235,235,70]
      end
      table info_contacto do
        
          row(0).font_style = :bold
          self.column_widths = [180,180,180]
      end
      table titulo_del_bien do
        
          row(0).font_style = :bold
          self.column_widths = [540]
      end
      @items.each do |item|
      table datos_del_bien(item) do
        
         row(0).font_style = :bold
          self.column_widths = [180,180,180]
      end
      table descripcion_del_bien(item) do

         row(0).font_style = :bold
          self.column_widths = [540]
      end
      end
      table titulo_del_proveedor do
        
         row(0).font_style = :bold
          self.column_widths = [540]
      end
      table datos_del_proveedor do
        
         row(0).font_style = :bold
          self.column_widths = [360,180]
      end
      table datos_contacto_proveedor do
        
          row(0).font_style = :bold
          self.column_widths = [180,180,180]
      end
      table titulo_referencia_cotizacion do
        row(0).font_style = :bold
        self.column_widths = [540]
      end
      table referencia_cotizacion_datos do
        row(0).font_style = :bold
        self.column_widths = [180,180,180]
      end
      table firma do
        
        row(0).font_style = :bold
        self.column_widths = [360,180]
        row(2).font_style = :bold
      end
      table aprobacion do
        self.column_widths = [180,180,180]
      end
    end
  end

    def info_solicitud
      [[{:content => "PARA:", :background_color => "DDDDDD" , :align => :left, :valign => :center, :size => 8, :height => 17},
        {:content => "DE:", :background_color => "DDDDDD", :align => :left, :valign => :center, :size => 8, :height => 17},
        {:content => "FECHA:",:background_color => "DDDDDD", :align => :left, :valign => :center, :size => 8, :height => 17}],

       [{:content => "Coordinación de Adquiciciones - ULab", :background_color => "FFFFFF", :align => :center, :valign => :center, :size => 8},
        {:content => "#{@servicerequest.seccion}", :background_color => "FFFFFF", :align => :center, :valign => :center, :size => 8},
        {:content => "#{@servicerequest.created_at.strftime("%d-%m-%Y")}", :background_color => "FFFFFF", :align => :center, :valign => :center, :size => 8}]]
    end

    def info_contacto
      [[{:content => "Persona Contacto de la Unidad Solicitante", :background_color => "DDDDDD" , :align => :left, :valign => :center, :size => 8, :height => 17  },
        {:content => "E-mail", :background_color => "DDDDDD", :align => :center, :valign => :center, :size => 8, :height => 17},
        {:content => "Télefono",:background_color => "DDDDDD", :align => :center, :valign => :center, :size => 8, :height => 17}],

       [{:content => "#{@servicerequest.contacto_int}", :background_color => "FFFFFF", :align => :center, :valign => :center, :size => 8},
        {:content => "#{@servicerequest.correo_int}", :background_color => "FFFFFF", :align => :center, :valign => :center, :size => 8},
        {:content => "#{@servicerequest.extension}", :background_color => "FFFFFF", :align => :center, :valign => :center, :size => 8}]]
    end

  def titulo_del_bien
    [[{:content => "DATOS DEL BIEN(OBJETO DEL SERVICIO)", :background_color => "DDDDDD" , :align => :center, :valign => :center, :size => 12  }]]
  end

  def datos_del_bien(item)

    [

     [{:content => "NOMBRE", :background_color => "DDDDDD" , :align => :center, :valign => :center, :size => 8, :height => 17  },
      {:content => "No. Bien Nacional", :background_color => "DDDDDD", :align => :center, :valign => :center, :size => 8, :height => 17},
      {:content => "UBICACIÓN FÍSICA",:background_color => "DDDDDD", :align => :center, :valign => :center, :size => 8, :height => 17}],

     [{:content => "#{item.nombre}", :background_color => "FFFFFF", :align => :center, :valign => :center, :size => 8},
      {:content => "#{item.numero}", :background_color => "FFFFFF", :align => :center, :valign => :center, :size => 8},
      {:content => "#{item.ubicacion}", :background_color => "FFFFFF", :align => :center, :valign => :center, :size => 8}],

    ]

  end

  def descripcion_del_bien(item)
    [
     [{:content => "DESCRIPCIÓN DETALLADA DEL SERVICIO", :background_color => "DDDDDD" , :align => :center, :valign => :center, :size => 8, :height => 17  }],
     [{:content => "#{item.descripcion}", :background_color => "FFFFFF", :align => :center, :valign => :justify, :size => 8, :height => 51}]
    ]
  end

  def titulo_del_proveedor
    [[{:content => "DATOS DEL PROVEEDOR DE SERVICIO", :background_color => "DDDDDD" , :align => :center, :valign => :center, :size => 12  }]]
  end

  def datos_del_proveedor

    [

     [{:content => "Compañía", :background_color => "DDDDDD" , :align => :center, :valign => :center, :size => 8 , :height => 17 },
      {:content => "RIF", :background_color => "DDDDDD", :align => :center, :valign => :center, :size => 8, :height => 17}],

     [{:content => "#{@empresa.nombre}", :background_color => "FFFFFF", :align => :center, :valign => :center, :size => 8, :height => 17},
      {:content => "#{@empresa.rif}", :background_color => "FFFFFF", :align => :center, :valign => :center, :size => 8, :height => 17},]

    ]

  end

  def datos_contacto_proveedor

        [
         [{:content => "Persona Contacto", :background_color => "DDDDDD" , :align => :center, :valign => :center , :size => 8, :height => 17 },
          {:content => "e-mail", :background_color => "DDDDDD", :align => :center, :valign => :center, :size => 8, :height => 17},
          {:content => "Télefono",:background_color => "DDDDDD", :align => :center, :valign => :center, :size => 8, :height => 17}],

         [{:content => "#{@empresa.contacto}", :background_color => "FFFFFF", :align => :center, :valign => :center, :size => 8, :height => 17},
          {:content => "#{@empresa.correo_contacto}", :background_color => "FFFFFF", :align => :center, :valign => :center, :size => 8, :height => 17},
          {:content => "#{@empresa.telefono}", :background_color => "FFFFFF", :align => :center, :valign => :center, :size => 8, :height => 17}]
        ]
  end

  def titulo_referencia_cotizacion
    [
        [{:content => "Referencia de Cotización", :background_color => "DDDDDD" , :align => :center, :valign => :center , :size => 8, :height => 17 }]
    ]
  end

  def referencia_cotizacion_datos
    [
          [{:content => "Fecha", :background_color => "DDDDDD" , :align => :center, :valign => :center, :size => 8 , :height => 17 },
           {:content => "No.", :background_color => "DDDDDD", :align => :center, :valign => :center, :size => 8, :height => 17},
           {:content => "Monto Total del Servicio (Bs.):",:background_color => "DDDDDD", :align => :center, :valign => :center, :size => 8, :height => 17}],

          [{:content => "#{@cotizacion.created_at.strftime("%d-%m-%Y")}", :background_color => "FFFFFF", :align => :center, :valign => :center, :size => 8, :height => 17},
           {:content => "#{@cotizacion.id}", :background_color => "FFFFFF", :align => :center, :valign => :center, :size => 8, :height => 17},
           {:content => "#{@servicerequest.monto}", :background_color => "FFFFFF", :align => :center, :valign => :center, :size => 8, :height => 17}]
    ]
  end

  def firma
    [
        [{:content => "OBSERVACIONES", :background_color => "DDDDDD" , :align => :center, :valign => :center, :size => 8, :height => 17  },
         {:content => "Firma y Sello", :background_color => "DDDDDD", :align => :center, :valign => :center, :size => 8, :height => 17}],

        [{:content => "#{@servicerequest.observacion}", :background_color => "FFFFFF", :align => :center, :valign => :center, :size => 8, :height => 51},
         {:content => "", :background_color => "FFFFFF", :align => :center, :valign => :center, :size => 8, :height => 51},],

        [{:content => "Por la Coordinación de Adquisiciones", :background_color => "DDDDDD" , :align => :center, :valign => :center, :size => 8 , :height => 17 },
         {:content => "Aprobado por:", :background_color => "DDDDDD", :align => :center, :valign => :center, :size => 8, :height => 17}]
    ]


  end

  def aprobacion
    [
     [{:content => "SUB-ACCION ESPECIFICA (SAE)", :background_color => "DDDDDD", :align => :center, :valign => :center, :size => 6, :font_style => :bold, :height => 17},
      {:content => "Lic. Thaylin Villa\nCoordinadora de Adquisiciones", :background_color => "FFFFFF", :align => :center, :valign => :bottom, :size => 6, :rowspan => 3},
      {:content => "Prof. Wilfrido Gonzalez\nDirector - Lab", :background_color => "FFFFFF", :align => :center, :valign => :bottom, :size => 6, :rowspan => 3}],

     [{:content => "", :background_color => "FFFFFF", :align => :center, :valign => :center, :size => 6, :height => 17}],

     [{:content => "PARTIDA", :background_color => "DDDDDD", :align => :center, :valign => :center, :size => 6, :font_style => :bold, :height => 17}],

     [{:content => "", :background_color => "FFFFFF", :align => :center, :valign => :center, :size => 6, :height => 17},
      {:content => "Fecha", :background_color => "FFFFFF", :align => :left, :valign => :center, :size => 6, :height => 17},
      {:content => "Fecha", :background_color => "FFFFFF", :align => :left, :valign => :center, :size => 6, :height => 17}],
    ]
  end

end
