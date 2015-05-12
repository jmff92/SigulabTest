class CampoDocumentoDonacion < ActiveRecord::Migration
  def change
  	  	add_column :donations, :document, :string
  end
end
