#!/bin/env ruby
# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Labs (name, sae_code, sae_name)
labs_list = [
  [ 'Dir', '01.05.03.01', 'Dirección ULAB' ],
  [ 'A', '01.05.03.01', 'Laboratorio A' ],
  [ 'B', '01.05.03.04', 'Laboratorio B' ],
  [ 'C', '01.05.03.05', 'Laboratorio C' ],
  [ 'D', '01.05.03.06', 'Laboratorio D' ],
  [ 'E', '01.05.03.07', 'Laboratorio E' ],
  [ 'F', '01.05.03.08', 'Laboratorio F' ],
  [ 'G', '01.05.03.09', 'Laboratorio G' ],
]
 
labs_list.each do |name, sae_code, sae_name|
  Lab.create(name: name, sae_code: sae_code, sae_name: sae_name)  
end

# Incomes (lab_id, amount, origin, description, date, organism, document, financing)
incomes_list = [
  [ 1, 896845.82, Income.origins[:reformulation], 'Reformulacion 2014', '1/1/2014' ],
  [ 3, 1030000.00, Income.origins[:ordinary], 'Asignacion Presupuesto 2014', '28/1/2014' ],
  [ 5, 3030000.00, Income.origins[:ordinary], 'Asignacion Inversion Presupuesto 2014', '31/3/2014' ],
  [ 8, 9936.50, Income.origins[:extraordinary], 'Donacion de la Asociacion de Estudiantes de IQ USB', '14/5/2014' ],
]
incomes_list.each do |lab_id, amount, origin, description, date|
  Income.create(lab_id: lab_id, amount: amount, origin: origin, description: description, date: DateTime.strptime(date,'%d/%m/%Y'))
end