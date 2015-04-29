class CreateTableItemsSolicitud < ActiveRecord::Migration
  def change
    create_table :table_items_solicituds do |t|
    	t.integer :codItem
    	t.integer :codSolicitud

    	t.timestamps
    end
  end
end
