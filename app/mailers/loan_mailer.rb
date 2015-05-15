class LoanMailer < ActionMailer::Base
  default from: 'notificacionesulab@gmail.com'

  def loan_email(email,items_id)
  	@email = email
  	
  	mail(to: @email, subject: 'Solicitud de Préstamo')
  end

end
