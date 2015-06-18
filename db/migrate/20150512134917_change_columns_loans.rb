class ChangeColumnsLoans < ActiveRecord::Migration
  def change
  	remove_column :loans, :enemar
  	remove_column :loans, :abrjul
  	remove_column :loans, :verano
  	remove_column :loans, :sepdic
  	add_column :loans, :periodo, :string
  end
end
