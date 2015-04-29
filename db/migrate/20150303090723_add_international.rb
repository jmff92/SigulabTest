class AddInternational < ActiveRecord::Migration
  def change
    add_column :invitations, :international, :integer
  end
end
