class CreateRejects < ActiveRecord::Migration
  def change
    create_table "rejects", force: true do |t|
	    t.string   "estado"
	    t.integer  "specification_id"
	    t.timestamps
    end
  end
end
