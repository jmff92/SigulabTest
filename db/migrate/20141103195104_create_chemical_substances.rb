class CreateChemicalSubstances < ActiveRecord::Migration
  def change
    create_table :chemical_substances do |t|
	  #Nombre
      t.string :name
	  #Pureza (deberia ser float entre 0 y 100)
      t.string :purity
	  #Estado Materia
      t.string :matter_states
	  #Cantidad (deberia ser float)
      t.string :quantity
	  
	  t.string :meassure
	  
	  #CAS (Deberia ser integer, y dar una ayuda de que es? y de que va sin '-')
      t.string :cas
	  #Estado (VIGENTE, VENCIDO, INDETERMINADO)
      t.string :status
	  #Responsable
      t.string :responsible
	  #Ubicacion (deberia ser lista desplegable o autocompletar)
      t.string :location
	  #Fecha de expiracion (mantener un ojo y cuando se acerca la fecha AVISAR)
      t.date :expiration_date
	  #Controlado
      t.boolean :controlled
	  #Aparece si Controlado=Si
      t.boolean :rI7
	  #Aparece si Controlado=Si
      t.boolean :rI4
	  
      t.boolean :toxic
      t.boolean :oxidant
      t.boolean :explosive
      t.boolean :irritating
      t.boolean :inflamable
      t.boolean :corrosive
      t.boolean :nocive
	  
      t.boolean :investigation
      t.boolean :teaching
      t.boolean :extention
      t.boolean :management

      t.timestamps
    end
  end
end
