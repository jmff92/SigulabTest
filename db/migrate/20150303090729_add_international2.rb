class AddInternational2 < ActiveRecord::Migration
  def change
    add_column :invitations, :tipo, :string
  end
end
