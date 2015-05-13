class ChangeReferenceBinnacles < ActiveRecord::Migration
  def change
  	change_column :binnacles, :idSustancia, :string, references: :chemical_substances
  end
end
