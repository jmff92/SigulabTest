class ChangeDescriptionBinnacles < ActiveRecord::Migration
  def change
  	change_column :binnacles, :descripcion, :text
  end
end
