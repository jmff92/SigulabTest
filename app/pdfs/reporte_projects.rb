# encoding: utf-8
class ReporteProjects < Prawn::Document
  include ActionView::Helpers::NumberHelper

  def initialize(projects,incomes,commitments,executions)
  	super :page_layout => :landscape
  	@projects = projects
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
  	text "RESUMEN PRESUPUESTARIO DE PROYECTOS", size: 12, :align => :center, style: :bold
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

  	[ ["Proyecto", "Monto Asignado", "Monto Comprometido", "Monto Ejecutado", "Saldo Disponible"] ] + 

  	@projects.map do |p|

  		@incomes_proj = @incomes.where(proyecto: p.id).sum(:amount)
  		@incomes_total += @incomes_proj

  		@commitments_proj = @commitments.where(proj_id: p.id).sum(:amount)
  		@commitments_total += @commitments_proj

  		@executions_commitment = @executions.where(proyecto: p.id).where("check_annulled=false").sum(:check_amount)
  		@executions_total += @executions_commitment

      @incomes_proj_pdf = number_to_currency(@incomes_proj, format: "%n", delimiter: ".", separator: ",")
      @commitments_proj_pdf = number_to_currency(@commitments_proj, format: "%n", delimiter: ".", separator: ",")      
      @executions_commitment_pdf = number_to_currency(@executions_commitment, format: "%n", delimiter: ".", separator: ",")      
      @available = number_to_currency(@incomes_proj-@commitments_proj, format: "%n", delimiter: ".", separator: ",")            

  		[p.project_number,"Bs. #{@incomes_proj_pdf}","Bs. #{@commitments_proj_pdf}","Bs. #{@executions_commitment_pdf}","Bs. #{@available}"]
  	end
  end

  def table2
    move_down 10  	
    table(content2, :position => 23, :width => 700, :cell_style => {:align => :center, :size => 10}) do
      row(0).background_color = "C0C0C0"
      column(0).width = 137
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
    move_down 65
      text "Universidad Simón Bolívar, Edif. Energética, Planta Baja. Valle de Sartenejas, Baruta, Caracas, Edo. Miranda, Venezuela, 89000", size: 9, :align => :center
      text "Telef.: 58 212 906-3708 / 3709 / 3710 / 3711 Fax: 58 212 906-3712 www.ulab.usb.ve", size: 9, :align => :center      

  end
  
end