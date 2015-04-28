class Project < ActiveRecord::Base

  attr_localized :amount, :equipments, :services, :infrastructure, :hhrr,
                 :consumables, :furniture, :other_amount

  enum admin: [:marquez, :villa]
  def self.admin_str
  [
    'Magaly Márquez',
    'Thailyn Villa'
  ]
  end

  enum status: [:pending, :executing, :reformulating, :annulled]
  def self.status_str
  [
    'En espera de recursos',
    'En ejecución',
    'En reformulación',
    'Anulado'
  ]
  end


  enum banco: [:banco100, :caribe, :activo, :agricola, :bicentenario, :caroni, :venezuela, :tesoro,
               :espirito, :exterior, :industrial, :internacional, :mercantil, :bnc, :occidental,
               :plaza, :provincial, :sofitasa, :venezolano, :bancrecer, :banesco, :bangente, :banplus, 
               :fondo, :citibank, :delsur, :mibanco]

  def self.banco_str
  [
    '100% Banco',
    'Bancaribe',     
    'Banco Activo',
    'Banco Agrícola de Venezuela',
    'Banco Bicentenario',
    'Banco Caroní',
    'Banco de Venezuela',  
    'Banco del Tesoro',
    'Banco Espirito Santo',
    'Banco Exterior',    
    'Banco Industrial de Venezuela',
    'Banco Internacional de Desarrollo',    
    'Banco Mercantil',    
    'Banco Nacional de Crédito',
    'Banco Occidental de Descuento', 
    'Banco Plaza',
    'Banco Provincial',
    'Banco Sofitasa',
    'Banco Venezolano de Crédito',
    'Bancrecer',
    'Banesco',
    'Bangente',
    'Banplus',
    'BFC Banco Fondo Común',
    'Citibank',
    'Del Sur Banco Universal',
    'Mi Banco - Banco Microfinanciero'
  ]
  end

  def incoming_date_required
      errors.add(:incoming_date, "no puede estar en blanco para modificar el status")
  end

  def annulled_date_required
      errors.add(:annulled_date, "no puede estar en blanco para modificar el status a Anulado")
  end

  def greater_zero?
  	  return other_amount > 0.00;
  end

  def chequeo?
      return status == "annulled";
  end

  validates :project_number, presence: true
  validates :project_number, numericality: { greater_than: 0 }, if: "!project_number.blank?"
  validates :contract, presence: true
  validates :contract, numericality: { greater_than: 0 }, if: "!contract.blank?"
  validates :title, presence: true
  validates :responsible, presence: true
  validates :admin, presence: true
  validates :sae_code, presence: true
  validates :amount, presence: true
  validates_numericality_of :amount, :greater_than_or_equal_to => 0, if: "!amount.blank?"
  validates :equipments, presence: true
  validates_numericality_of :equipments, :greater_than_or_equal_to => 0, if: "!equipments.blank?"
  validates :services, presence: true
  validates_numericality_of :services, :greater_than_or_equal_to => 0, if: "!services.blank?"
  validates :infrastructure, presence: true
  validates_numericality_of :infrastructure, :greater_than_or_equal_to => 0, if: "!infrastructure.blank?"
  validates :hhrr, presence: true
  validates_numericality_of :hhrr, :greater_than_or_equal_to => 0, if: "!hhrr.blank?"
  validates :consumables, presence: true
  validates_numericality_of :consumables, :greater_than_or_equal_to => 0, if: "!consumables.blank?"
  validates :banco, presence: true
  validates :num_cuenta, presence: true
  validates :num_cuenta, length: { is: 20 }, numericality: { only_integer: true }, if: "!num_cuenta.blank?"
  validates :furniture, presence: true
  validates_numericality_of :furniture, :greater_than_or_equal_to => 0, if: "!furniture.blank?"
  validates :other_amount, presence: true
  validates_numericality_of :other_amount, :greater_than_or_equal_to => 0, if: "!other_amount.blank?"
  validates :other_desc, presence: true, if: "greater_zero?"
  validates :annulled_date, presence: true, if: 'chequeo?'

end
