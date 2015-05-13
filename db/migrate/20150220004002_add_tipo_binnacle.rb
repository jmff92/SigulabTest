class AddTipoBinnacle < ActiveRecord::Migration
  def change
  	add_column :binnacles, :tipo, :string
  end
end
