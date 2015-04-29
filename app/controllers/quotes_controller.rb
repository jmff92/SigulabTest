class QuotesController < ApplicationController
  layout "application_compras"
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  # GET /quotes
  # GET /quotes.json
  def index
	if current_user
    @quotes = Quote.where(:user_id => current_user.username, :specification_id => session[:specification_sel_id]).all
    @sumQuotes = Quote.where(:user_id => current_user.username, :specification_id => session[:specification_sel_id]).count
   end
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
     @itemsquote = Itemsquote.where(:id_oferta => params[:id]).all
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
      if session[:specification_sel_tipo] == "Servicios"
         @items = Service.where(:user_id => current_user.username, :specification_id => session[:specification_sel_id]).all
      else
         @items = Item.where(:user_id => current_user.username, :specification_id => session[:specification_sel_id]).all
      end 
         @invitations = Invitation.where(:user_id => current_user.username, :specification_id => session[:specification_sel_id]).all
  end

  # GET /quotes/1/edit
  def edit
	if session[:specification_sel_tipo] == "Servicios"
         @items = Service.where(:user_id => current_user.username, :specification_id => session[:specification_sel_id]).all
      else
         @items = Item.where(:user_id => current_user.username, :specification_id => session[:specification_sel_id]).all
      end 
         @invitations = Invitation.where(:user_id => current_user.username, :specification_id => session[:specification_sel_id]).all
  end

  # POST /quotes
  # POST /quotes.json
  def create
    @quote = Quote.new(quote_params)
    @quote.user_id = current_user.username
    idq = params[:quote][:quot].to_i
    invitation = Invitation.find(idq)
    @quote.nombre = invitation.nombre;
    specification = Specification.find(session[:specification_sel_id])
    specification.p4 = 1
    specification.p5 = 1
    session[:specification_p4] = specification.p4
    session[:specification_p5] = specification.p5
    specification.save
    @quote.save
    quotew = Quote.find(@quote.id)
     params.each do |k,x|
    if k.include?("itemsquotes")
      @itemsquote = Itemsquote.new
      @itemsquote.id_oferta = @quote.id
      @itemsquote.id_item = x.to_i
      if session[:specification_sel_tipo] == "Servicios"
         @itemsquote.nombre_item = Service.find(x.to_i).nombre
      else
	 @item = Item.find(x.to_i)
	 @item.comprar = 1
         @itemsquote.nombre_item = @item.nombre
         @item.save
      end
      @itemsquote.specification_id = session[:specification_sel_id];
      @itemsquote.save
    end
    end
    nombre = "Especificacion_#{session[:specification_sel_id]}_Oferta_Empresa_#{quotew.nombre}"
    tmp = quotew.attachment_url
    quotew.ataname = tmp.gsub("nca",nombre)
    
    File.open("#{Rails.root}/public"+quotew.attachment_url) do |file|
  	File.rename(file, "#{Rails.root}/public"+quotew.ataname)
    end
    
    invitation.quote_id = @quote.id;
    invitation.save
    cont = Invitation.where(:user_id => current_user.username, :specification_id => session[:specification_sel_id], :quote_id => -1).count
    if cont == 0
       specification = Specification.find(session[:specification_sel_id])
       specification.p2 = 2
       cont2 = Invitation.where(:user_id => current_user.username, :specification_id => session[:specification_sel_id]).count
	if cont2 > 1
	specification.p5 = 0
       session[:specification_p5] = specification.p3
	end
       specification.p3 = 2
       session[:specification_p3] = specification.p3
    session[:specification_p2] = specification.p2
    ct = Quote.where(:user_id => current_user.username, :specification_id => session[:specification_sel_id]).count
    if ct > 1
      specification.p5 = 0
      session[:specification_p5] = specification.p5
    end
    specification.save
   
     end
    respond_to do |format|
     
        format.html { redirect_to quotes_url, notice: 'Quote was successfully created.' }
        format.json { render :show, status: :created, location: @quote }
   
    end
  end

  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to quotes_url, notice: 'Quote was successfully updated.' }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url, notice: 'Quote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_params
      params.require(:quote).permit(:nombre, :attachment, :specification_id)
    end
end
