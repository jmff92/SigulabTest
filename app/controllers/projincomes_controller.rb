class ProjincomesController < ApplicationController
  layout 'bootlayout'

  before_filter :authenticate_user!

  def index
    @project = Project.find(params[:id])
    @projincomes = Projincome.all.order("date ASC").where("proyecto=?",params[:id])
    @sum = @projincomes.sum(:amount)
  end

  def show
    @projincome = Projincome.find(params[:id])
    @project = Project.find(@projincome.proyecto)
  end

  def all
    @projincomes = Projincome.all.order("date ASC")
    @sum = @projincomes.sum(:amount)
  end
  
  def new
    @projincome = Projincome.new
    if params[:id]
       @project = Project.find(params[:id])
       @projincome.proyecto = params[:id]
    end
  end
  
  def create
    # Check Date
    unless params[:projincome].nil?
      begin
        params[:projincome][:date] = Date.parse(params[:projincome][:date])
      rescue ArgumentError
        params[:projincome][:date] = nil
      end
    end

    if params[:projincome][:resource] == ""
    	params[:projincome][:resource] = 0
    end
    
    if params[:projincome][:document] != nil
      archivo = params[:projincome][:document];
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
    
    @projincome = Projincome.new(projincome_params)
    @projincome.description = @projincome.description.upcase
    @projincome.organism = @projincome.organism.upcase
    @projincome.unit = @projincome.unit.upcase
    @projincome.variation = @projincome.variation.upcase
    @projincome.resource_description = @projincome.resource_description.upcase
  
    if @projincome.save
      redirect_to controller: 'projincomes', id: params[:id]
    else
      render 'new'
    end
  end
  
  def edit
    @projincome = Projincome.find(params[:id])
    @project = Project.find(Projincome.find(params[:id]).proyecto)
  end
  
  def update
    # Check Date
    unless params[:projincome].nil?
      begin
        params[:projincome][:date] = Date.parse(params[:projincome][:date])
      rescue ArgumentError
        params[:projincome][:date] = nil
      end
    end

    if params[:projincome][:resource] == ""
    	params[:projincome][:resource] = 0
    end

    if (params[:projincome][:document] != nil)
      archivo = params[:projincome][:document];
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



    @projincome = Projincome.find(params[:id])
    params[:projincome][:description] = params[:projincome][:description].upcase
    params[:projincome][:organism] = params[:projincome][:organism].upcase
    params[:projincome][:unit] = params[:projincome][:unit].upcase
    params[:projincome][:variation] = params[:projincome][:variation].upcase
    params[:projincome][:resource_description] = params[:projincome][:resource_description].upcase
  
    if @projincome.update_attributes(projincome_params)
      redirect_to projincome_url(@projincome)
    else
      render 'edit'
    end
  end
  
  private
  
    def projincome_params
      params.require(:projincome).permit(:proyecto, :sae_code, :origin, :amount, :concept, :description, :date, :organism, :document, :financing, :doc_code, :doc_date, :unit, :observations)
    end

end
