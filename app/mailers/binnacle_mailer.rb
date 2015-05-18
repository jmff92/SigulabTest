class BinnacleMailer < ActionMailer::Base
  default from: 'notificacionesulab@gmail.com'

  def binnacle_email(email,sustancia)
  	@email = email
  	@sustancia = ChemicalSubstance.where(id2: sustancia)
  	mail(to: @email, subject: 'Advertencia de Sustancia Química')
  end
end
