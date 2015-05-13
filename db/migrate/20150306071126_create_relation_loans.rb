class CreateRelationLoans < ActiveRecord::Migration
  def change
    create_table :relation_loans do |t|
      t.string :prestamo
      t.string :item

      t.timestamps
    end
  end
end
