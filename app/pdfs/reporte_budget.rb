# encoding: utf-8
class ReporteBudget < Prawn::Document
  include ActionView::Helpers::NumberHelper

  def initialize(labs,incomes,commitments,executions)
  	super :page_layout => :landscape
  	@labs = labs
  	@incomes = incomes
  	@commitments = commitments
  	@executions = executions
  	header
    date_title
    table1
    table2
    footer
  end
 
  def header
  	y_position = cursor - 40
    image "#{Rails.root}/app/assets/images/cebolla.png", width: 55, :at => [75, cursor]
    image "#{Rails.root}/app/assets/images/Logo_ULab.jpg", width: 35, :at => [685, cursor-40]
	  bounding_box([0, y_position], :width => 200, :height => 40) do
      text "UNIVERSIDAD SIMÓN BOLÍVAR", size: 10, style: :bold, :align => :center
      text "VICERRECTORADO ACADÉMICO", size: 9, :align => :center
      text "UNIDAD DE LABORATORIOS", size: 8, :align => :center
	end
  end

  def date_title
  	move_down 10
  	text "#{Date.today.strftime("%d")}/#{Date.today.strftime("%m")}/#{Time.now.year}", size: 10, :align => :right
    move_down 20
  	text "RESUMEN PRESUPUESTARIO", size: 12, :align => :center, style: :bold
    move_down 30  	
  end

  def table1
    table(content1, :position => 23, :width => 700, :cell_style => {:align => :center, :size => 10}) do
      row(0).background_color = "C0C0C0"
    end   
    move_down 20    
  end

  def content1

  	@incomes_total = 0
  	@commitments_total = 0  	
  	@executions_total = 0  	

  	[ ["Dependencia", "Monto Asignado", "Monto Comprometido", "Monto Ejecutado", "Saldo Disponible"] ] + 

  	@labs.map do |lab|

  		@incomes_lab = @incomes.where(lab_id: lab.id).sum(:amount)
  		@incomes_total += @incomes_lab

  		@commitments_lab = @commitments.where(lab_id: lab.id).sum(:amount)
  		@commitments_total += @commitments_lab

      @executions_commitement = @executions.joins(commitment: :lab).where("lab_id=?", lab.id).where("check_annulled=false").sum(:check_amount)
  		@executions_total += @executions_commitement

      @incomes_lab_pdf = number_to_currency(@incomes_lab, format: "%n", delimiter: ".", separator: ",")
      @commitments_lab_pdf = number_to_currency(@commitments_lab, format: "%n", delimiter: ".", separator: ",")      
      @executions_commitement_pdf = number_to_currency(@executions_commitement, format: "%n", delimiter: ".", separator: ",")      
      @available = number_to_currency(@incomes_lab-@commitments_lab, format: "%n", delimiter: ".", separator: ",")            

  		[lab.sae_name,"Bs. #{@incomes_lab_pdf}","Bs. #{@commitments_lab_pdf}","Bs. #{@executions_commitement_pdf}","Bs. #{@available}"]
  	end
  end

  def table2
    move_down 10  	
    table(content2, :position => 23, :width => 700, :cell_style => {:align => :center, :size => 10}) do
      row(0).background_color = "C0C0C0"
      column(0).width = 185
    end   
    move_down 20    
  end

  def content2
    @incomes_total_pdf = number_to_currency(@incomes_total, format: "%n", delimiter: ".", separator: ",")
    @commitments_total_pdf = number_to_currency(@commitments_total, format: "%n", delimiter: ".", separator: ",")    
    @executions_total_pdf = number_to_currency(@executions_total, format: "%n", delimiter: ".", separator: ",")    
    @available_total = number_to_currency(@incomes_total-@commitments_total, format: "%n", delimiter: ".", separator: ",")    

  	[ ["", "Monto Asignado", "Monto Comprometido", "Monto Ejecutado", "Saldo Disponible"] ] + 
  	[ ["TOTALES","Bs. #{@incomes_total}","Bs. #{@commitments_total}","Bs. #{@executions_total}","Bs. #{@available_total}"] ]
  end

  def footer
    move_down 40
      text "Universidad Simón Bolívar, Edif. Energética, Planta Baja. Valle de Sartenejas, Baruta, Caracas, Edo. Miranda, Venezuela, 89000", size: 9, :align => :center
      text "Telef.: 58 212 906-3708 / 3709 / 3710 / 3711 Fax: 58 212 906-3712 www.ulab.usb.ve", size: 9, :align => :center      

  end

end
