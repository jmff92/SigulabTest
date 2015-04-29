class ChangeDefaultValAdmin < ActiveRecord::Migration
  def change
	change_column_default(:incomes, :origin, nil)
	change_column_default(:incomes, :financing, nil)
	change_column_default(:commitments, :document, nil)
	change_column_default(:projcommitments, :document, nil)
  end
end
