class AddCheckAnnulledToExecutions < ActiveRecord::Migration
  def change
    add_column :executions, :check_annulled, :boolean, default: false
  end
end
