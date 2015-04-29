class AddAnnulledDateProjects < ActiveRecord::Migration
  def change
    add_column :projects, :annulled_date, :date
  end
end
