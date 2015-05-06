# encoding: utf-8
class AutorizacionPago < Prawn::Document
  include ActionView::Helpers::NumberHelper

  def initialize(pay)
  	super :page_layout => :portrait
    @pay = pay
  	header
    registro
    info
    pago
    observaciones
    firmas
    uso_ulab
    contact
  end
 
  def header
    font "Times-Roman"
  	y_position = cursor - 55
    image "#{Rails.root}/app/assets/images/cebolla.png", width: 75, :at => [63, cursor]
    image "#{Rails.root}/app/assets/images/Logo_ULab.jpg", width: 45, :at => [480, cursor-40]
	  bounding_box([0, y_position], :width => 200, :height => 40) do
      text "UNIVERSIDAD SIMÓN BOLÍVAR", size: 12, style: :bold, :align => :center
      text "VICERRECTORADO ACADÉMICO", size: 10, :align => :center
      text "UNIDAD DE LABORATORIOS", size: 9, :align => :center
	  end
    move_down 20
  end

  def registro
    data = [ ["AUTORIZACIÓN DE PAGO", "Registro:"],
           ["  ", "#{@pay.registry}"],
           ]
    table (data) do
      cells.valign = :center
      cells.align = :center      
      cells.background_color = "ededed"

      row(0).font_style = :bold
      column(0).width = 400
      column(1).width = 125

      column(0).row(0).borders = [:left, :top, :right]
      column(0).row(1).borders = [:left, :bottom, :right]
      column(0).row(0).align = :center
      column(0).row(0).size = 14
      column(1).size = 10
      column(1).row(1).background_color = "FFFFFF"

    end
    move_down 10
  end

  def info
    data = [ ["PARA:", "DE:", "FECHA:"],
           ["UNIDAD DE LABORATORIOS", "#{@pay.from}", "#{@pay.elaboration_date}"],  # Obtener mes de sistema
           ]
    table (data) do
      cells.valign = :center
      cells.align = :center    
      row(0).align = :left
      cells.background_color = "ededed"
      cells.size = 10

      row(0).font_style = :bold
      column(0).width = 200
      column(1).width = 200
      column(2).width = 125

      row(1).align = :center
      row(1).background_color = "FFFFFF"
      row(1).height = 40
    end
    move_down 10
  end  

  def pago

    @amount = number_to_currency(@pay.amount, format: "%n", delimiter: ".", separator: ",")

    data = [ ["PÁGUESE A:", "CI O RIF:"],
           ["#{@pay.recipient}", "#{@pay.delivered_id}"],
           ["POR CONCEPTO DE:", "LA CANTIDAD DE (Bs.F):"],
           ["#{@pay.concept}", "#{@amount}"],
           ]
    table (data) do
      cells.valign = :center
      cells.align = :center    
      cells.background_color = "ededed"
      cells.size = 10

      row(0).font_style = :bold
      row(2).font_style = :bold      
      column(0).width = 350
      column(1).width = 175

      row(1).background_color = "FFFFFF"
      row(3).background_color = "FFFFFF"
      row(1).height = 20
      row(3).height = 50      
    end
    move_down 10
  end    

  def observaciones
    data = [ ["OBSERVACIONES / EXPOSICIÓN DE MOTIVOS", "Firma y Sello"],
           ["#{@pay.observations}", "\n _______________________"]
           ]
    table (data) do
      cells.valign = :center
      cells.align = :center    
      cells.background_color = "ededed"
      cells.size = 10

      row(0).font_style = :bold
      column(0).width = 350
      column(1).width = 175

      row(1).background_color = "FFFFFF"
      row(1).height = 60
     
    end
    move_down 10
  end  

  def firmas
    data = [ ["Por la Coordinación de Adquisiciones", "Aprobado por:"],
           ]
    table (data) do
      cells.valign = :center
      cells.align = :center    
      cells.background_color = "ededed"
      cells.size = 10
      cells.font_style = :bold
      column(0).width = 350
      column(1).width = 175
    end

    data = [ ["SUB-ACCION ESPECIFICA (SAE)", " ", " "],
            [" ", " ", " "],
            ["PARTIDA", "Lic. Thailyn Villa \n Coordinadora de Adquisiciones", "Prof. Wilfrido González \n Director"],
            ["   ", "Fecha: ", "Fecha: "],
           ]
    table (data) do
      cells.valign = :center
      cells.align = :center    
      cells.background_color = "FFFFFF"
      cells.size = 10
      column(0).font_style = :bold
      cells.width = 175
      column(0).row(0).background_color = "ededed"
      column(0).row(2).background_color = "ededed"

      row(0).column(1..2).borders = [:left, :top, :right]
      row(1..2).column(1..2).borders = [:left, :right]
      row(3).column(1..2).borders = [:left, :right, :bottom]
      row(3).column(1..2).align = :left
     
    end
    move_down 10
  end  

  def uso_ulab
    data = [ ["Para uso de la Unidad de Administración de la ULab:"]
           ]
    table (data) do
      cells.valign = :center
      cells.align = :center    
      cells.background_color = "ededed"
      cells.size = 10
      cells.font_style = :bold
      column(0).width = 525
    end

    data = [ ["Fecha de Recepción:", "Recibido por:", " "],
            [" ", " ", " \n Firma "]
           ]
    table (data) do
      cells.valign = :center
      cells.align = :center    
      cells.background_color = "FFFFFF"
      cells.size = 10
      row(0).font_style = :bold
      cells.width = 175
      row(0).column(0..1).background_color = "ededed"
      row(0).column(2).borders = [:left, :top, :right]
      row(1).column(2).borders = [:left, :bottom, :right]      
    
    end
    move_down 10
  end  
 

  def contact
    bounding_box([-25, 35], :width => 600, :height => 40) do
      text "Universidad Simón Bolívar, Edif. Energética, Planta Baja. Valle de Sartenejas, Baruta, Caracas, Edo. Miranda, Venezuela, 89000", size: 10, :align => :center
      text "Telef.: 58 212 906-3708 / 3709 / 3710 / 3711  Fax: 58 212 906-3712   www.ulab.usb.ve", size: 10, :align => :center
    end   
  end

end
