class CamposPrestamo < ActiveRecord::Migration
  def change
  	add_column :loans, :docencia, :boolean
  	add_column :loans, :investigacion, :boolean
  	add_column :loans, :extension, :boolean
  	add_column :loans, :apoyo, :boolean
  	add_column :loans, :enemar, :boolean
  	add_column :loans, :abrjul, :boolean
  	add_column :loans, :verano, :boolean
  	add_column :loans, :sepdic, :boolean
  	add_column :loans, :sem1, :boolean
  	add_column :loans, :sem2, :boolean
  	add_column :loans, :sem3, :boolean
  	add_column :loans, :sem4, :boolean
  	add_column :loans, :sem5, :boolean
  	add_column :loans, :sem6, :boolean
  	add_column :loans, :sem7, :boolean
  	add_column :loans, :sem8, :boolean
  	add_column :loans, :sem9, :boolean
  	add_column :loans, :sem10, :boolean
  	add_column :loans, :sem11, :boolean
  	add_column :loans, :sem12, :boolean
  	add_column :loans, :horalunes, :time
  	add_column :loans, :horaMartes, :time
  	add_column :loans, :horaMiercoles, :time
  	add_column :loans, :horaJueves, :time
  	add_column :loans, :horaViernes, :time
  	add_column :loans, :lunes, :boolean
  	add_column :loans, :martes, :boolean
  	add_column :loans, :miercoles, :boolean
  	add_column :loans, :jueves, :boolean
  	add_column :loans, :viernes, :boolean
  	add_column :loans, :persona, :string
  	add_column :loans, :cedula, :integer
  	add_column :loans, :todoLun, :boolean
  	add_column :loans, :todoMar, :boolean
  	add_column :loans, :todoMie, :boolean
  	add_column :loans, :todoJue, :boolean
  	add_column :loans, :todoVie, :boolean
  end
end
