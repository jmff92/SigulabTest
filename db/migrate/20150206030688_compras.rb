class Compras < ActiveRecord::Migration
  create_table "acts", force: true do |t|
    t.string   "numRegistro"
    t.string   "proveedor"
    t.string   "bienServicio"
    t.string   "tesis"
    t.string   "responsable"
    t.string   "justificacion"
    t.string   "providencia"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_id"
    t.integer  "specification_id"
  end

create_table "invitations", force: true do |t|
    t.string   "nombre"
    t.string   "rif"
    t.string   "direccion"
    t.string   "correo"
    t.string   "telefono"
    t.string   "telefono_Adicional"
    t.string   "responsable"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_id"
    t.integer  "specification_id"
    t.integer  "quote_id"
  end

  create_table "items", force: true do |t|
    t.string   "nombre"
    t.string   "tipo"
    t.text     "descripcion"
    t.integer  "dimensiones_alto"
    t.integer  "dimensiones_ancho"
    t.integer  "dimensiones_largo"
    t.integer  "cantidad"
    t.string   "unidad_alto"
    t.string   "unidad_ancho"
    t.string   "unidad_largo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "numeroBien"
    t.string   "user_id"
    t.integer  "specification_id"
  end

  create_table "itemsquotes", force: true do |t|
    t.integer "id_item"
    t.string  "nombre_item"
    t.integer "id_oferta"
    t.integer "compra"
    t.integer "specification_id"
  end

create_table "quotes", force: true do |t|
    t.string   "nombre"
    t.string   "attachment"
    t.string   "ataname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_id"
    t.integer  "specification_id"
  end

  create_table "recommendations", force: true do |t|
    t.text    "codigo"
    t.text    "via"
    t.integer "specification_id"
    t.integer "user_id"
  end

  create_table "recommendations_empresas", force: true do |t|
    t.integer "quote_id"
    t.integer "id_informe"
    t.integer "opcion_numero"
    t.text    "empresa"
    t.integer "calidad_pro"
    t.integer "disponibilidad_pro"
    t.integer "proveedor_unico"
    t.integer "calidad_ser"
    t.integer "garantia"
    t.integer "servicio_post"
    t.integer "cumplimiento_esp"
    t.integer "precio"
    t.integer "tiempo"
    t.integer "cumplio_req"
  end

  create_table "requisitions", force: true do |t|
    t.string   "solicitante"
    t.string   "consumidor"
    t.string   "partida"
    t.string   "autor"
    t.text     "observacion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_id"
  end

  create_table "services", force: true do |t|
    t.string   "nombre"
    t.string   "numero"
    t.string   "tipo"
    t.text     "descripcion"
    t.string   "ubicacion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_id"
    t.integer  "specification_id"
  end

  create_table "specifications", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_id"
    t.string   "nombre"
    t.string   "tipo"
    t.integer  "p1"
    t.integer  "p2"
    t.integer  "p3"
    t.integer  "p4"
    t.integer  "p5"
    t.integer  "p6"
    t.integer  "p7"
  end


end
