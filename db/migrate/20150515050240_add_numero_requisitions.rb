class AddNumeroRequisitions < ActiveRecord::Migration
  def change
  	add_column :requisitions, :numero, :string
  end
end
