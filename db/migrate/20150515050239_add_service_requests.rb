class AddServiceRequests < ActiveRecord::Migration
def change
create_table "servicerequests", force: true do |t|

t.string   "seccion"

t.string   "contacto_int"
t.string   "correo_int"
t.string   "extension"			










t.string   "monto"
t.text     "observacion"
t.integer "specification_id"
t.datetime "fecha"

t.datetime "created_at"
t.datetime "updated_at"
t.string   "user_id"
t.timestamps
end
end
end
