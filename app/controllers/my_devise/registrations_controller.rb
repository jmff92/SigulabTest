# app/controllers/my_devise/registrations_controller.rb
class MyDevise::RegistrationsController < Devise::RegistrationsController

  skip_before_filter :require_login

	def update
		super
	end
	private
	def sign_up_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation, :external, :technician, :labBoss,
			:proy_responsible, :section_boss, :labassistant, :directorate, :gsmp, :quality_analist, :quality, :manage_analist, 
			:manage, :import_analist, :import, :acquisition_analist, :acquisition, :director, :name, :surname)
	end
	def account_update_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password, :external, 
			:proy_responsible, :section_boss, :labassistant, :directorate, :gsmp, :quality_analist, :quality, :manage_analist, 
			:manage, :import_analist, :import, :acquisition_analist, :acquisition, :director, :technician, :labBoss, :name, :surname)
	end
end
