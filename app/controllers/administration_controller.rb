class AdministrationController < ApplicationController
  layout 'bootlayout'
  
  before_filter :authenticate_user!
  before_action :set_subsystem 
  
  def index
  end

  private
  
  def set_subsystem
    @subsystem = 'administracion'
  end
  
end
