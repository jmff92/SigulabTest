class AddServicerequests < ActiveRecord::Migration
def change
create_table "servicerequests", force: true do |t|
t.boolean  "tipo_servicio"
t.string   "seccion"
t.integer  "lab_id"
t.string   "contacto_int"
t.string   "correo_int"
t.string   "extension"			
t.string   "nombre"
t.string   "nro_bien"
t.string   "ubicacion"
t.text     "descripcion"
t.string   "compania"
t.string   "rif"
t.string   "contacto_ext"
t.string   "correo_ext"
t.string   "telefonos"
t.string   "nro_cotizacion"
t.string   "monto"
t.text     "observacion"
t.string   "sae_code"
t.string   "partida"
t.datetime "created_at"
t.datetime "updated_at"
t.string   "user_id"
t.timestamps
end
end
end
