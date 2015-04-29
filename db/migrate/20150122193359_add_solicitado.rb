class AddSolicitado < ActiveRecord::Migration
  def change
  	add_column :loans, :solicitado, :boolean
  	add_column :applications, :solicitado, :boolean
  end
end
