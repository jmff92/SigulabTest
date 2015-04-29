class StaticsController < ApplicationController
   layout "appindex"
   before_filter :authenticate_user!

	def index
	end

end
