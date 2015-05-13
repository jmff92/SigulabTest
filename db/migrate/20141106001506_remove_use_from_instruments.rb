class RemoveUseFromInstruments < ActiveRecord::Migration
  def change
    remove_column :instruments, :use, :string
  end
end
