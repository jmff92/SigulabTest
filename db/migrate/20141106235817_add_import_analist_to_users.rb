class AddImportAnalistToUsers < ActiveRecord::Migration
  def change
    add_column :users, :import_analist, :boolean
  end
end
