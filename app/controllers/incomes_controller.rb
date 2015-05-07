class IncomesController < ApplicationController
  layout 'bootlayout'

  before_filter :authenticate_user!

  def index
    @incomes = Income.all.where("valid_adm=? AND valid_dir=?", true, true).order("date ASC")
    @sum = @incomes.sum(:amount)
  end

  def list_lab
    @lab = Lab.find(params[:id])
    @incomes = Income.all.order("date ASC").where("lab_id=?", params[:id]).where("valid_adm=? AND valid_dir=?", true, true)
    @sum = @incomes.sum(:amount)
  end

  def show
    @income = Income.find(params[:id])  
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReporteIncomes.new(@income)
        send_data pdf.render, filename: 'MOD-01.pdf', type: 'application/pdf'
      end
    end
  end
  
  def new
    @income = Income.new
    @labs = Lab.all
  end
  
  def create
    # Check Date
    unless params[:income].nil?
      begin
        params[:income][:date] = Date.parse(params[:income][:date])
      rescue ArgumentError
        params[:income][:date] = nil
      end
    end

    if params[:income][:resource] == ""
    	params[:income][:resource] = 0
    end
    
    if params[:income][:document] != nil
      archivo = params[:income][:document];      
      #Nombre original del archivo.
      nombre = archivo.original_filename;
      #Directorio donde se va a guardar.
      directorio = "public/archivos/";
      #Extensión del archivo.
      extension = nombre.slice(nombre.rindex("."), nombre.length).downcase;
      #Ruta del archivo.
      path = File.join(directorio, nombre);
      #Crear en el archivo en el directorio. Guardamos el resultado en una variable, será true si el archivo se ha guardado correctamente.
      resultado = File.open(path, "wb") { |f| f.write(archivo.read) };
      #Verifica si el archivo se subió correctamente.
      if resultado
        subir_archivo = "ok";
      else
        subir_archivo = "error";
      end
    end

    @income = Income.new(income_params)
  
    if @income.save
#      redirect_to action: 'index'
		  redirect_to incomes_path, notice: "The document has been uploaded."
    else
      @labs = Lab.all
      render 'new'
    end
  end
  
  def edit
    @income = Income.find(params[:id])
    @labs = Lab.all
  end
  
  def update
    # Check Date
    unless params[:income].nil?
      begin
        params[:income][:date] = Date.parse(params[:income][:date])
      rescue ArgumentError
        params[:income][:date] = nil
      end
    end

    if params[:income][:resource] == ""
    	params[:income][:resource] = 0
    end

    if (params[:income][:document] != nil)
      archivo = params[:income][:document];
      #Nombre original del archivo.
      nombre = archivo.original_filename;
      #Directorio donde se va a guardar.
      directorio = "public/archivos/";
      #Extensión del archivo.
      extension = nombre.slice(nombre.rindex("."), nombre.length).downcase;
      #Ruta del archivo.
      path = File.join(directorio, nombre);
      #Crear en el archivo en el directorio. Guardamos el resultado en una variable, será true si el archivo se ha guardado correctamente.
      resultado = File.open(path, "wb") { |f| f.write(archivo.read) };
      #Verifica si el archivo se subió correctamente.
      if resultado
        subir_archivo = "ok";
      else
        subir_archivo = "error";
      end
    end



    @income = Income.find(params[:id])
  
    if @income.update_attributes(income_params)
      redirect_to income_url(@income)
    else
      @labs = Lab.all
      render 'edit'
    end
  end

  def delete
    @income = Income.find params[:id]
    @income.destroy
    redirect_to :back    
  end    

  def valid_adm
    @income = Income.find(params[:id])
    @income.update_attribute(:valid_adm, true)
    redirect_to :back
  end  

  def valid_dir
    @income = Income.find(params[:id])
    @income.update_attribute(:valid_dir, true)
    redirect_to :back
  end     
  
  private
  
    def income_params
      params.require(:income).permit(:lab_id, :sae_code, :origin, :amount, :description, :date, :organism, :document, :financing, :doc_code, :doc_date, :unit, :variation, :resource, :resource_description, :valid_adm, :valid_dir)
    end
  
end
