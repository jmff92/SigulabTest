class Paymentauth < ActiveRecord::Base

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
    'Laboratorio G - Dirección',
    'Coordinación de Adquisiciones',
    'Coordinación de Calidad',
    'Coordinación de Importaciones',
    'Unidad de Administración'
  ]
  end

end
