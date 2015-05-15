class LoanMailer < ActionMailer::Base
  default from: 'notificacionesulab@gmail.com'

  def loan_email(email,items_id)
  	@email = email
  	@sustancias = ChemicalSubstance.where(id2: items_id)
  	@instruments = Instrument.where(id2: items_id)
  	@tools = Tool.where(id2: items_id)
  	@equipments = Equipment.where(id2: items_id)
  	@consumables = Consumable.where(id2: items_id)
  	mail(to: @email, subject: 'Solicitud de Préstamo')
  end

end
