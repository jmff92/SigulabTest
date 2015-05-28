class PoasController < ApplicationController
  layout 'bootlayout'

  before_filter :authenticate_user!

  def index
    @poas = Poa.all.order("year DESC")
  end

  def new
  	@poa = Poa.new
  end

  def create    
    if params[:poa][:document] != nil
      archivo = params[:poa][:document];      
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


    @poa = Poa.new(poa_params)
    if @poa.save
      redirect_to action: 'index'
#		redirect_to poas_path, notice: "The document has been uploaded."
    else
      render 'new'
    end
  end

    def edit
      @poa = Poa.find(params[:id])
    end
    
    def update
      @poa = Poa.find(params[:id])
      if @poa.update_attributes(poa_params)
        redirect_to poa_url(@poa)
      else
        render 'edit'
      end
    end

  def delete
    @poa = Poa.find(params[:id])
    @poa.update_column(:del, true)
    redirect_to :back
  end

  def valid_dir
    @poa = Poa.find(params[:id]).destroy
    redirect_to :back    
  end

  def no_valid_dir
    @poa = Poa.find(params[:id])
    @poa.update_column(:del, false)
    redirect_to action: :notifications, controller: :administration    
  end

  private
  
    def poa_params
      params.require(:poa).permit(:document, :year)
    end

end
