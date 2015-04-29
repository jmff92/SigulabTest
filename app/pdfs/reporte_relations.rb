# encoding: utf-8
class ReporteRelations < Prawn::Document

  def initialize(relation, sid, item, tipo) 
    super()
    @relation = relation
    @sid = sid
    @item = item
    @tipo = tipo
    header
    repeat :all do
      pie_de_pagina
    end
    titulo
    titulo2
    titulo3
    titulo4
    titulo5
    titulo6
    titulo7
    titulo8
    titulo9
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
      [[{:content => "RELACIÓN DESCRIPTIVA DE MATERIALES / EQUIPOS", :rowspan => 2, :size => 20, :background_color => "DDDDDD",
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
      [[{:content => "Nombre comercial del material/equipo", :background_color => "DDDDDD", :align => :center}],
        [{:content => "#{@item.nombre}", :background_color => "FFFFFF", :align => :center}]]
   end
     def titulo3
    move_down 0
      table tittle3 do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD','DDDDDD']
      self.column_widths = [270,270]
    end
   end

   def tittle3
      [[{:content => "Marca", :background_color => "DDDDDD", :align => :center},{:content => "Modelo", :background_color => "DDDDDD", :align => :center}],
        [{:content => "#{@relation.marca}", :background_color => "FFFFFF", :align => :center},{:content => "#{@relation.modelo}", :background_color => "FFFFFF", :align => :center}]]
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
      [[{:content => "Tipo", :background_color => "DDDDDD", :align => :center}],
        [{:content => "#{@tipo}", :background_color => "FFFFFF", :align => :center}]]
   end

def titulo5
    move_down 4
      table tittle5 do
      row(0).font_style = :bold
	row(2).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD','DDDDDD']
      self.column_widths = [540]
    end
   end

   def tittle5
      [[{:content => "Descripción General", :background_color => "DDDDDD", :align => :center}],
        [{:content => "#{@relation.descripcion_general}", :background_color => "FFFFFF", :align => :center}]]
   end

def titulo6
    move_down 4
      table tittle6 do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD','DDDDDD']
      self.column_widths = [540]
    end
   end

   def tittle6
      [[{:content => "Descripción Especifíca", :background_color => "DDDDDD", :align => :center}]]
   end

def titulo7
    move_down 0
      table tittle7 do
      self.header = true
      self.row_colors = ['DDDDDD','DDDDDD']
      self.column_widths = [270,270]
    end
   end

   def tittle7
      [[{:content => "Materia constitutiva", :background_color => "DDDDDD", :align => :left}, {:content => "#{@relation.materia}", :background_color => "FFFFFF", :align => :left}], [{:content => "Función", :background_color => "DDDDDD", :align => :left}, {:content => "#{@relation.funcion}", :background_color => "FFFFFF", :align => :left}], [{:content => "Aplicación particular", :background_color => "DDDDDD", :align => :left}, {:content => "#{@relation.aplicacion}", :background_color => "FFFFFF", :align => :left}], [{:content => "Ubicación física", :background_color => "DDDDDD", :align => :left}, {:content => "#{@relation.ubicacion}", :background_color => "FFFFFF", :align => :left}]]
   end

def titulo8
    move_down 4
      table tittle8 do
      self.header = true
	row(0).font_style = :bold
      self.row_colors = ['DDDDDD','DDDDDD']
      self.column_widths = [135,135,135,135]
    end
   end

   def tittle8
      [[{:content => "Peso", :background_color => "DDDDDD", :align => :left}, {:content => "Ancho", :background_color => "DDDDDD", :align => :left}, {:content => "Alto", :background_color => "DDDDDD", :align => :left}, {:content => "Largo", :background_color => "DDDDDD", :align => :left}], [{:content => "#{@relation.peso} #{@relation.dimensiones_peso}", :background_color => "FFFFFF", :align => :left}, {:content => "#{@relation.ancho} #{@relation.dimensiones_ancho}", :background_color => "FFFFFF", :align => :left}, {:content => "#{@relation.alto} #{@relation.dimensiones_alto}", :background_color => "FFFFFF", :align => :left}, {:content => "#{@relation.largo} #{@relation.dimensiones_largo}", :background_color => "FFFFFF", :align => :left}]]
   end
def titulo9
    move_down 4
      table tittle9 do
      row(0).font_style = :bold
	row(2).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD','DDDDDD']
      self.column_widths = [540]
    end
   end

   def tittle9
      [[{:content => "Observaciones", :background_color => "DDDDDD", :align => :center}],
        [{:content => "#{@relation.observaciones}", :background_color => "FFFFFF", :align => :center}]]
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
