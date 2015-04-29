class CreateRelations < ActiveRecord::Migration
  def change
    create_table "relations", force: true do |t|
    t.integer "item_id"
    t.string "marca"
    t.string   "modelo"
    t.string   "tipo"
    t.string   "descripcion_general"
    t.string  "materia"
    t.string  "funcion"
    t.string  "ubicacion"
    t.string  "aplicacion"
  end
  
    create_table "requests", force: true do |t|
    t.string "unidad_solicitante"
    t.string "persona_contacto"
    t.string   "telefono"
    t.string   "email"
    t.string   "fondos"
    t.string  "numero_proyecto"
    t.string  "funcion"
    t.string  "tipo_cuenta"
    t.string  "numero_cuenta"
    t.string  "nombre_banco"
    t.string  "otro"
    t.string  "proforma"
    t.string  "folleto"
    t.string  "fonacit"
    t.string  "acta_consejo_directo"
  end
  end
end
