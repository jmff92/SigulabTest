class LoanMailer < ActionMailer::Base
  default from: 'notificacionesulab@gmail.com'


  def loan_email(email)
  	@email = email
  	mail(to: @email, subject: 'Solicitud de Préstamo')
  end

end
