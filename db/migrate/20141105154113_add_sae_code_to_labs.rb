class AddSaeCodeToLabs < ActiveRecord::Migration
  def change
    add_column :labs, :sae_code, :string, unique: true
  end
end
