class ComprandoController < ApplicationController
   layout 'bootlayout'

   def seleccionarEspecificacion
      @specification = Specification.find(params[:specification])
      session[:specification_sel_nombre] = @specification.nombre
      session[:specification_sel_id] = @specification.id
      session[:specification_sel_tipo] = @specification.tipo
      session[:specification_p1] = @specification.p1
      session[:specification_p2] = @specification.p2
      session[:specification_p3] = @specification.p3
      session[:specification_p4] = @specification.p4
      session[:specification_p5] = @specification.p5
      session[:specification_p6] = @specification.p6
      session[:specification_p7] = @specification.p7
      session[:specification_p8] = @specification.p8
      session[:specification_p9] = @specification.p9
      
      session[:specification_sel_nacional] = @specification.nacional
      session[:recom_id] = -1   
      if @specification.tipo == "Servicios"
         session[:specification_sel_link] = "/services/"
      else
         session[:specification_sel_link] = "/items/"
      end
      @estado =  Reject.where(:specification_id => @specification.id).first
      
      if @estado != nil && @estado.estado == "Rechazar solicitud"
		  respond_to do |format|
			 format.html { redirect_to devolutions_url, notice: 'Especificacion Seleccionada' } 
		  end
      else
		respond_to do |format|
			 format.html { redirect_to session[:specification_sel_link], notice: 'Especificacion Seleccionada' } 
		  end
	  end
      
      
   end

   def solicitudCompra
   end

   def compra
   end
  
   def recepcionBienes
   end
  
   def conformidadServicio
	end

end
