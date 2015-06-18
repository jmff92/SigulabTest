class CreatePoa < ActiveRecord::Migration
  def change
    create_table :poas do |t|
      t.string :document
      t.integer :year
    end
  end
end
