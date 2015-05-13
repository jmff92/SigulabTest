# encoding: utf-8
class ReporteIncomes < Prawn::Document
  include ActionView::Helpers::NumberHelper

  def initialize(income)
  	super :page_layout => :landscape
    @income = income
  	header
    id
    info
    contact
  end
 
  def header
  	y_position = cursor - 40
    image "#{Rails.root}/app/assets/images/cebolla.png", width: 50, :at => [75, cursor]
	  bounding_box([0, y_position], :width => 200, :height => 40) do
      text "UNIVERSIDAD SIMÓN BOLÍVAR", size: 8, style: :bold, :align => :center
      text "Dirección de Finanzas - Oficina de Presupuesto", size: 8, :align => :center
      text "Comisión de Planificación y Desarrollo", size: 8, :align => :center
	end
  end

  def id
    data = [ ["AÑO: ", "#{Time.now.year}"],     #  Obtener año de sistema
           ["MES: ", "#{Date.today.strftime("%B")}"],  # Obtener mes de sistema
           ["UNIDAD EJECUTORA: ", "Unidad de Laboratorios"], 
           ["RESPONSABLE DE LA UNIDAD: ", "Prof. José Gregorio Ruiz Camacho"]
           ]

    table (data) do
      cells.padding = 1
      cells.size = 8
      cells.height = 12
      cells.borders = []
      cells.font_style = :bold
      column(0).align = :right
      column(1).align = :left      
      column(0).rows(2..3).background_color = "C0C0C0"
    end
    move_down 20
  end

  def info 

    @amount = number_to_currency(@income.amount, format: "%n", delimiter: ".", separator: ",")

    data = [ ["", "(1) SAE", "", "ORIGEN DEL RECURSO", "", "", "", "", "APLICACIÓN DEL RECURSO", ""],
           ["Código", "Denominación", "(2) Organismo que otorga",
            "(3) No. de Acta de Aprobación y/o Documentos del mismo", "(4) Fuente de Financiamiento",
            "(5) Monto en Bs.", "(6) Unidad de Medida", "(7) Variación de la meta física", "(8) Proyecto / 
            Meta / Gasto / Inversiones", "(9) Descripción de la meta / Proyecto o concepto del Gasto / Inversión"],
           ["#{@income.sae_code}","Unidad de Laboratorios","#{@income.organism}","#{@income.doc_code} del #{@income.doc_date}",
            "#{Income.financing_str[Income.financings[@income.financing]]}","Bs. #{@amount}",
            "#{@income.unit}","#{@income.variation}",
            "#{Income.resource_str[Income.resources[@income.resource]]}","#{@income.resource_description}"]
           ]
    table(data) do
      cells.size = 7
      cells.valign = :center

      column(1).background_color = "BFBFBF"
      row(0).background_color = "CCFFFF"
      row(1).background_color = "CCCCFF"

      column(0).row(0).borders = [:left, :top, :bottom]
      column(1).row(0).align = :left
      column(1).row(0).borders = [:right, :top, :bottom]      

      row(0).column(3).borders = [:top, :bottom]      
      row(0).column(3).align = :center
      row(0).column(4).borders = [:right, :top, :bottom]      
      row(0).column(2).borders = [:left, :top, :bottom]      

      row(0).column(5).borders = [:left, :right, :bottom]
      row(0).column(5).background_color = "FFFFFF"

      row(0).column(7).borders = [:top, :bottom]      
      row(0).column(8).borders = [:top, :bottom]            
      row(0).column(8).align = :center
      row(0).column(9).borders = [:right, :top, :bottom]      
      row(0).column(6).borders = [:left, :top, :bottom]   

      row(1).align = :center
      row(1).height = 60

      column(3).width = 70
      column(8).width = 60
      column(7).width = 55      
      column(6).width = 55
      column(5).width = 70
      column(4).width = 100   
      column(1).width = 70
      column(0).width = 55
      column(2).width = 70      

      column(0).align = :center
      column(3).align = :center      
      column(5).align = :right
      column(5).row(1).align = :center      
      column(6).align = :center
      column(7).align = :center
      column(8).align = :center            


#      cells.height = 12
      row(0..1).font_style = :bold
      column(5).font_style = :bold

      row(2).height = 60
      row(2).border_line = [:solid, :solid, :dotted, :solid]
    end
    move_down 20    
  end

  def contact
    data = [ ["Elaborado por : ", "Lic. Thailyn Villa"],
           ["Telf. Ext. : ", "3708 al 11 su ext 105"],
           ]

    table (data) do
      cells.padding = 1
      cells.size = 8
      cells.height = 12
      cells.borders = []
      cells.font_style = :bold
      column(0).align = :right
      column(1).align = :left      
    end    
  end

end