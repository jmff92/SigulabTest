class AddSaeNameToLabs < ActiveRecord::Migration
  def change
    add_column :labs, :sae_name, :string, unique: true
  end
end
