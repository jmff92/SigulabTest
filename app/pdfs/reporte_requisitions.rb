# encoding: utf-8
class ReporteRequisitions < Prawn::Document

  def initialize(requisition,items,services) 
    super()
    @requisition = requisition
    @items = items
	 @services = services
    move_up 30
    titulo
    contenido
    pie_de_pagina
  end

  def titulo
   move_down 13
   table tittle do
      self.header = true
      self.row_colors = ['FFFFFFF','FFFFFF']
      self.column_widths = [230,230,80]
    end
  end

  def contenido
   move_down 13
   table content do
      self.header = true
      self.row_colors = ['FFFFFFF','FFFFFF']
      self.column_widths = [60,60,60,360]
    end
    if @items.count > 0 then
		 table lista do
			  self.column_widths = [60,60,60,360]
			  self.cell_style = { :size => 6, :height => 15 } 
		 end
    end
    table completar do
		  self.column_widths = [60,60,60,360]
		  self.cell_style = { :size => 6, :height => 12} 
    end

	 stroke do
    	  horizontal_line 0, 540, :at => 212
    end
    move_down 5
    font_size 6
    draw_text "#{@requisition.solicitante}", :at => [80,635]
    draw_text "#{@requisition.consumidor}", :at => [320,635]
    draw_text "DE #{page_count}", :at => [485,675]  
    draw_text "#{Time.now.strftime("%d/%m/%Y")}", :at => [480,635] 
    draw_text "#{Time.now.strftime("%d/%m/%Y")}", :at => [210,35] 
    text "10. CARGUESE A LA PARTIDA: #{@requisition.partida}", :size => 6
    draw_text " DE: #{@requisition.autor} ", :at => [250,190], :size => 6
    move_down 25
	 text "11. DISPONIBILIDAD                     Bs <u>__________</u>   ", :size => 6, :inline_format => true
    move_down 5

    table extra do
       self.column_widths = [180,50,60,70,180]
       self.cell_style = { :size => 6} 
	 end

    table extra2 do
       self.column_widths = [160,130,70,180]
       self.cell_style = { :size => 6} 
	 end

   
  end

  def tittle 
       image = "#{Rails.root}/app/assets/images/coord.jpg" 
      [[{:image => image, :image_height => 65, :image_width => 110, :colspan => 2, :rowspan => 2, :borders => [:right, :bottom],
																																  :padding => [0,0,10,30]}, 
        																{:content => "1. \n No. 000#{@requisition.id}", :size => 6,  :borders => [:bottom] }],
		 [{:content => "2. PÁG No. #{page_count} ", :size => 6, :borders => [:bottom]}],
       [{:content => "4. UNIDAD SOLICITANTE", :size => 6, :height => 45,  :borders => [:bottom]},
		  {:content => "5. UNIDAD CONSUMIDORA.", :size => 6},{:content => "6. FECHA:", :size => 6,  :borders => [:bottom]}]]
       
  end

  def content
      move_up 13

 		[[{:content => "6. ITEM",:height => 30, :size => 6, :borders => [:right]},{:content => "7. CANTIDAD \n SOLICITADA",
																											:height => 30, :size => 6,:borders => [:top]},
		  {:content => "8. UNIDAD \n (MEDIDA) ",:height => 30, :size => 6},{:content => "9. MATERIAL, SU DESCRIPCIÓN Y CARACTERÍSTICAS",
																								 :height => 30, :size => 9, :align => :center, :borders => [:left]}]]
  end

  def lista
		@items.map do |item|
      	[{:content => item.nombre, :borders => [:bottom, :top, :right]} , item.cantidad,item.unidad,
			 {:content => item.descripcion+", Dimensiones: "+item.dimensiones, :borders => [:bottom, :top]}]
      end
  end

  def completar
	  i=0
	  filas = 30 - @items.count
	  data=[[{:content=>" ",:borders=>[:right, :top]},{:content=>" ",:borders=>[:right, :top]},
            {:content=>" ",:borders=>[:right, :top]},{:content=>" ",:borders=>[:left, :top]}]]
	  while i <filas do
 	  	  	data1=[[{:content=>" ",:borders=>[:right, :top]},{:content=>" ",:borders=>[:right, :top]},
                {:content=>" ",:borders=>[:right, :top]},{:content=>" ",:borders=>[:left, :top]}]]
		   data=data+data1
		   i=i+1
	  end
	  return data
		
  end 

  def extra
  		[[{:content => "12. Observaciones: #{@requisition.observacion}", :rowspan => 6,  :borders => [:right, :top, :bottom]},{:content=>"15. FECHA
     	D       |        M"},
        {:content =>"16. No O/C"},{ :content =>  "17. \n .             ITEM"},{:content => "19.", :rowspan => 6, :borders => [:top]}],
       [" "," "," "],
       [" "," "," "],
       [" "," "," "],
       [" "," "," "],
       [" "," "," "]]
  end

  def extra2
   
     [[{:content => "13. FIRMA AUTORIZADA DEL SOLICITANTE", :borders => [:right, :bottom]},"14. FECHA", "18. CANTIDAD ITEM",
																				{:content => "FIRMA Y SELLO DE LA  UNIDAD \n 
                                                                          RESPONSABLE DE LA COMPRA", :align => :center,
																								  :borders => [:bottom]}]]

  end


  def pie_de_pagina
      
    	draw_text "Formulario 411-01 DII 01/99                          Original: Dpto. de Contabilidad   /   Duplicado: Dpto. de Compras   /   Triplicado: Unidad 
		Solicitante", :size => 6, :at => [1,16]    
  end
 
end
