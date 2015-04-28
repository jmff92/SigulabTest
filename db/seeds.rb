#!/bin/env ruby
# encoding: utf-8

# Labs (name, sae_code, sae_name, description)
labs_list = [
  [ 'Dir', '01.05.03.01', 'Dirección ULAB', 'Administración De Laboratorios, Sartenejas' ],
  [ 'A', '01.05.03.03', 'Laboratorio A', 'Laboratorios De Ingeniería Aplicada' ],
  [ 'B', '01.05.03.04', 'Laboratorio B', 'Laboratorios De Biología, Química y Polímeros' ],
  [ 'C', '01.05.03.05', 'Laboratorio C', 'Laboratorios De Electrónica' ],
  [ 'D', '01.05.03.06', 'Laboratorio D', 'Laboratorios De Física' ],
  [ 'E', '01.05.03.07', 'Laboratorio E', 'Laboratorios De Materiales y Procesos De Fabricación' ],
  [ 'F', '01.05.03.08', 'Laboratorio F', 'Laboratorios De Tecnología De La Información' ],
  [ 'G', '01.05.03.09', 'Laboratorio G', 'Laboratorios Del Litoral' ],
  [ 'DirG', '01.05.03.02', 'Laboratorio G - Administración', 'Administración De Laboratorios, Litoral' ],
]

labs_list.each do |name, sae_code, sae_name, description|
  Lab.create(name: name, sae_code: sae_code, sae_name: sae_name, description: description)  
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