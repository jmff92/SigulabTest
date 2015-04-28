class CreateRelationServices < ActiveRecord::Migration
  def change
    create_table :relation_services do |t|
      t.string :servicio
      t.string :item

      t.timestamps
    end
  end
end
