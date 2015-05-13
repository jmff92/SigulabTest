class CreateTools < ActiveRecord::Migration
  def change
    create_table "tools", force: true do |t|
	    t.string   "name"
	    t.string   "brand"
	    t.integer  "national_good"
	    t.string   "status"
	    t.string   "responsible"
	    t.string   "location"
	    t.string   "material"
	    t.string   "bill"
	    t.string   "type"
	    t.boolean  "from_set"
	    t.boolean  "investigation"
	    t.boolean  "teaching"
	    t.boolean  "extention"
	    t.boolean  "management"
	    t.float    "cost"
	    t.string   "buy_order"
	    t.datetime "adquisition_date"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.timestamps
    end
  end
end
