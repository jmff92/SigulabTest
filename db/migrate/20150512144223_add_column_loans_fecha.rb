class AddColumnLoansFecha < ActiveRecord::Migration
  def change
  	add_column :loans, :desde, :date
  end
end
