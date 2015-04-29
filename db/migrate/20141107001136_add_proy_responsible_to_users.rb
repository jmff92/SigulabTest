class AddProyResponsibleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :proy_responsible, :boolean
  end
end
