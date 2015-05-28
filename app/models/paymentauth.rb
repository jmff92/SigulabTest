class Paymentauth < ActiveRecord::Base

  attr_localized :amount

  enum from: [:dir, :a, :b, :c, :d, :e, :f, :g, :dirg, :acq, :qua, :imp, :man]
  def self.origin_str
  [
    'Dirección ULAB',
    'Laboratorio A',
    'Laboratorio B',
    'Laboratorio C',
    'Laboratorio D',
    'Laboratorio E',
    'Laboratorio F',
    'Laboratorio G',
    'Laboratorio G - Administración',
    'Coordinación de Adquisiciones',
    'Coordinación de la Calidad',
    'Coordinación de Importaciones',
    'Unidad de Administración'
  ]
  end

  validates :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }, if: "!amount.blank?"
  validates :concept, presence: true, length: {maximum: 512}
  validates :observations, length: {maximum: 1024}
  validates :registry, presence: true, length: {maximum: 512}
  validates :recipient, presence: true, length: {maximum: 512}
  validates :from, presence: true
  validates :delivered_id, presence: true

end
