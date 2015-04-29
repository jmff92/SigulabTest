class CreateExecutions < ActiveRecord::Migration
  def change
    create_table :executions do |t|
      #Required on integration #!
      #t.references :executable, polymorphic: true
      
      t.references :commitment, index: true
      
      t.string :code
      t.float :amount
      t.datetime :date
      
      t.timestamps
    end
  end
end
