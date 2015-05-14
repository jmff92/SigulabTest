# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150513233500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "applications", force: true do |t|
    t.string   "fechaRequerida"
    t.string   "descripcion"
    t.string   "uso"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "de"
    t.string   "personaContactoUnidadS"
    t.string   "telefono1"
    t.string   "telefono2"
    t.string   "companiaDepencia"
    t.string   "rif"
    t.string   "personaContactoCompania"
    t.string   "email1"
    t.string   "email2"
    t.string   "telefono3"
    t.string   "telefono4"
    t.time     "fechaCotizacion"
    t.integer  "noCotizacion"
    t.integer  "montoTotalServicio"
    t.string   "observacionesFinales"
  end

  create_table "binnacles", force: true do |t|
    t.string   "idSustancia"
    t.date     "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "medidaConsumo"
    t.string   "medidaIngreso"
    t.float    "consumo",       default: 0.0
    t.float    "ingreso",       default: 0.0
    t.text     "descripcion"
    t.string   "tipo"
    t.string   "format"
    t.float    "total",         default: 0.0
  end

  create_table "checks", force: true do |t|
    t.integer  "execution_id"
    t.string   "check_number"
    t.float    "amount"
    t.date     "elaboration_date"
    t.date     "sign_date"
    t.date     "delivery_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "checks", ["execution_id"], name: "index_checks_on_execution_id", using: :btree

  create_table "chemical_substances", force: true do |t|
    t.string   "name"
    t.string   "matter_states"
    t.string   "meassure"
    t.string   "cas"
    t.string   "status"
    t.string   "responsible"
    t.string   "location"
    t.date     "expiration_date"
    t.boolean  "controlled"
    t.boolean  "rI7"
    t.boolean  "rI4"
    t.boolean  "toxic"
    t.boolean  "oxidant"
    t.boolean  "explosive"
    t.boolean  "irritating"
    t.boolean  "inflamable"
    t.boolean  "corrosive"
    t.boolean  "nocive"
    t.boolean  "investigation"
    t.boolean  "teaching"
    t.boolean  "extention"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "purity"
    t.float    "quantity"
    t.decimal  "cost"
    t.string   "bill"
    t.string   "buy_order"
    t.date     "adquisition_date"
    t.boolean  "showable",         default: true
    t.string   "dependency"
    t.boolean  "solicitados"
    t.string   "id2"
    t.string   "origen"
    t.string   "correo"
  end

  create_table "commitments", force: true do |t|
    t.integer  "lab_id"
    t.string   "code"
    t.float    "amount"
    t.string   "description"
    t.string   "recipient"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sae_code"
    t.text     "observations"
    t.integer  "document"
  end

  create_table "consumables", force: true do |t|
    t.string   "name"
    t.string   "material"
    t.string   "quantity"
    t.string   "location"
    t.string   "responsible"
    t.boolean  "investigation"
    t.boolean  "teaching"
    t.boolean  "extention"
    t.boolean  "management"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "cost"
    t.string   "bill"
    t.string   "buy_order"
    t.date     "adquisition_date"
    t.text     "description"
    t.boolean  "showable",                default: true
    t.string   "dependency"
    t.boolean  "solicitados"
    t.string   "id2"
    t.string   "origen"
    t.string   "NumDonacion"
    t.string   "FechaDonacion"
    t.string   "PJDonacion"
    t.string   "PersonaContactoDonacion"
    t.string   "correo"
  end

  create_table "devolutions", force: true do |t|
    t.string   "numRegistro"
    t.string   "numRequisicion"
    t.boolean  "requisicion"
    t.string   "numAutorizacion"
    t.boolean  "autorizacion"
    t.string   "numCertificacion"
    t.boolean  "certificacion"
    t.string   "numSolicitud"
    t.boolean  "solicitud"
    t.string   "numInforme"
    t.boolean  "informe"
    t.string   "numOtro"
    t.boolean  "otro"
    t.string   "otro_especifico"
    t.boolean  "disponibilidad"
    t.boolean  "idioma"
    t.boolean  "discriminado"
    t.boolean  "firma"
    t.boolean  "carencia"
    t.boolean  "nombre"
    t.boolean  "direccion"
    t.boolean  "datos"
    t.boolean  "rif"
    t.boolean  "telefonos"
    t.boolean  "persona"
    t.boolean  "otroCarencia"
    t.string   "descripcion"
    t.boolean  "contacto"
    t.boolean  "copia"
    t.boolean  "factura"
    t.boolean  "foto"
    t.string   "unidadSolicitante"
    t.string   "observaciones"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_id"
    t.integer  "specification_id"
  end

  create_table "donations", force: true do |t|
    t.string   "nombreItem"
    t.string   "marca"
    t.string   "modelo"
    t.string   "cantidad"
    t.string   "unidadMedida"
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "estimado"
    t.string   "numDocumento"
    t.date     "fechaDocumento"
    t.string   "document"
  end

  create_table "equipment", force: true do |t|
    t.string   "name"
    t.string   "brand"
    t.string   "model"
    t.string   "serial"
    t.integer  "national_good"
    t.string   "status"
    t.date     "last_calibration"
    t.string   "responsible"
    t.string   "location"
    t.date     "adquisition_date"
    t.string   "buy_order"
    t.string   "bill"
    t.boolean  "investigation"
    t.boolean  "teaching"
    t.boolean  "extention"
    t.boolean  "management"
    t.string   "calibrated"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "cost"
    t.float    "length"
    t.float    "depth"
    t.float    "width"
    t.string   "measurelength"
    t.string   "measuredepth"
    t.string   "measurewidth"
    t.boolean  "showable",                default: true
    t.string   "dependency"
    t.integer  "numSolicitud"
    t.boolean  "solicitados"
    t.string   "id2"
    t.string   "origen"
    t.string   "NumDonacion"
    t.string   "FechaDonacion"
    t.string   "PJDonacion"
    t.string   "PersonaContactoDonacion"
    t.string   "correo"
  end

  create_table "executions", force: true do |t|
    t.integer  "commitment_id"
    t.string   "code"
    t.float    "check_amount"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "document",               default: 0
    t.string   "check_number"
    t.date     "check_elaboration_date"
    t.date     "check_sign_date"
    t.date     "check_delivery_date"
    t.integer  "check_delivery_status"
    t.boolean  "check_annulled",         default: false
    t.string   "remarks"
    t.string   "document_name"
    t.date     "document_date"
    t.string   "invoice_number"
    t.date     "invoice_date"
    t.boolean  "valid_adm",              default: false
    t.boolean  "valid_dir",              default: false
  end

  add_index "executions", ["commitment_id"], name: "index_executions_on_commitment_id", using: :btree

  create_table "incomes", force: true do |t|
    t.integer  "lab_id"
    t.float    "amount"
    t.integer  "origin"
    t.string   "description"
    t.date     "date"
    t.string   "organism"
    t.string   "document"
    t.string   "unit"
    t.integer  "resource",             default: 0
    t.string   "variation"
    t.string   "resource_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sae_code"
    t.integer  "financing"
    t.string   "doccode"
    t.string   "doc_code"
    t.date     "doc_date"
    t.boolean  "valid_adm",            default: false
    t.boolean  "valid_dir",            default: false
  end

  create_table "instruments", force: true do |t|
    t.string   "name"
    t.string   "brand"
    t.string   "model"
    t.string   "measurement_unit"
    t.float    "capacity"
    t.string   "material"
    t.string   "status"
    t.string   "location"
    t.date     "last_calibration"
    t.string   "responsible"
    t.integer  "national_good"
    t.boolean  "investigation"
    t.boolean  "teaching"
    t.boolean  "extention"
    t.boolean  "management"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "cost"
    t.string   "bill"
    t.string   "buy_order"
    t.date     "adquisition_date"
    t.boolean  "showable",                default: true
    t.string   "dependency"
    t.boolean  "solicitados"
    t.string   "id2"
    t.string   "origen"
    t.string   "NumDonacion"
    t.string   "FechaDonacion"
    t.string   "PJDonacion"
    t.string   "PersonaContactoDonacion"
    t.string   "correo"
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
    t.string   "tipo"
    t.string   "contacto"
    t.string   "correo_contacto"
    t.date     "fecha_tope"
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
    t.integer  "comprar"
  end

  create_table "itemsquotes", force: true do |t|
    t.integer "id_item"
    t.string  "nombre_item"
    t.integer "id_oferta"
    t.integer "compra"
    t.integer "specification_id"
  end

  create_table "labs", force: true do |t|
    t.string "name"
    t.string "sae_code"
    t.string "sae_name"
    t.string "description"
  end

  create_table "loans", force: true do |t|
    t.string   "ubicacion"
    t.string   "condiciones"
    t.string   "medida"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "fechaEntrega"
    t.date     "fechaTope"
    t.string   "unidadMedida"
    t.string   "descripcion"
    t.string   "uso"
    t.boolean  "esprestado"
    t.boolean  "docencia"
    t.boolean  "investigacion"
    t.boolean  "extension"
    t.boolean  "apoyo"
    t.boolean  "sem1"
    t.boolean  "sem2"
    t.boolean  "sem3"
    t.boolean  "sem4"
    t.boolean  "sem5"
    t.boolean  "sem6"
    t.boolean  "sem7"
    t.boolean  "sem8"
    t.boolean  "sem9"
    t.boolean  "sem10"
    t.boolean  "sem11"
    t.boolean  "sem12"
    t.time     "horalunes"
    t.time     "horaMartes"
    t.time     "horaMiercoles"
    t.time     "horaJueves"
    t.time     "horaViernes"
    t.boolean  "lunes"
    t.boolean  "martes"
    t.boolean  "miercoles"
    t.boolean  "jueves"
    t.boolean  "viernes"
    t.string   "persona"
    t.integer  "cedula"
    t.boolean  "todoLun"
    t.boolean  "todoMar"
    t.boolean  "todoMie"
    t.boolean  "todoJue"
    t.boolean  "todoVie"
    t.string   "periodo"
    t.date     "desde"
    t.time     "finLunes"
    t.time     "finMartes"
    t.time     "finMiercoles"
    t.time     "finJueves"
    t.time     "finViernes"
    t.time     "maxDevolucion"
  end

  create_table "paymentauths", force: true do |t|
    t.string   "recipient"
    t.string   "registry"
    t.date     "elaboration_date"
    t.date     "delivery_date"
    t.string   "delivered_id"
    t.string   "concept"
    t.float    "amount"
    t.string   "observations"
    t.string   "recieved_by"
    t.boolean  "is_valid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.string   "user"
    t.integer  "from"
  end

  create_table "poas", force: true do |t|
    t.string  "document"
    t.integer "year"
  end

  create_table "projcommitments", force: true do |t|
    t.integer  "proj_id"
    t.string   "code"
    t.float    "amount"
    t.string   "description"
    t.string   "recipient"
    t.date     "date"
    t.text     "observations"
    t.integer  "document"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "valid_res",    default: false
  end

  create_table "projects", force: true do |t|
    t.integer  "project_number"
    t.integer  "contract"
    t.string   "title"
    t.string   "responsible"
    t.string   "sae_code"
    t.decimal  "amount",         default: 0.0
    t.decimal  "equipments",     default: 0.0
    t.decimal  "services",       default: 0.0
    t.decimal  "infrastructure", default: 0.0
    t.decimal  "hhrr",           default: 0.0
    t.decimal  "consumables",    default: 0.0
    t.date     "incoming_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "admin"
    t.integer  "status",         default: 0
    t.float    "furniture",      default: 0.0
    t.string   "other_desc"
    t.decimal  "other_amount",   default: 0.0
    t.string   "num_cuenta"
    t.date     "annulled_date"
    t.string   "substitute"
    t.text     "observation"
    t.integer  "banco"
    t.boolean  "valid_res",      default: false
  end

  create_table "projexecutions", force: true do |t|
    t.integer  "proyecto"
    t.integer  "commitment_id"
    t.string   "code"
    t.float    "check_amount"
    t.date     "date"
    t.integer  "document"
    t.string   "check_number"
    t.date     "check_elaboration_date"
    t.date     "check_sign_date"
    t.date     "check_delivery_date"
    t.integer  "check_delivery_status"
    t.boolean  "check_annulled",         default: false
    t.string   "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "document_date"
    t.string   "invoice_number"
    t.date     "invoice_date"
    t.boolean  "valid_res",              default: false
  end

  create_table "projincomes", force: true do |t|
    t.integer  "proyecto"
    t.string   "sae_code"
    t.integer  "origin"
    t.string   "description"
    t.float    "amount"
    t.string   "concept"
    t.integer  "financing"
    t.string   "organism"
    t.date     "date"
    t.string   "document"
    t.string   "doc_code"
    t.string   "doc_url"
    t.date     "doc_date"
    t.string   "unit"
    t.string   "observations"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projpaymentauths", force: true do |t|
    t.integer  "proyect"
    t.string   "recipient"
    t.string   "registry"
    t.string   "from"
    t.date     "elaboration_date"
    t.date     "delivery_date"
    t.string   "delivered_id"
    t.string   "concept"
    t.float    "amount"
    t.string   "observations"
    t.string   "recieved_by"
    t.boolean  "is_valid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.string   "user"
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
    t.string  "responsale"
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

  create_table "records", force: true do |t|
    t.string   "fecha"
    t.string   "nos"
    t.string   "tipoServicio"
    t.string   "descripcion"
    t.string   "fechaini"
    t.string   "fechafin"
    t.string   "observaciones"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "idEquipo"
  end

  create_table "relation_loans", force: true do |t|
    t.string   "prestamo"
    t.string   "item"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relation_services", force: true do |t|
    t.string   "servicio"
    t.string   "item"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relations", force: true do |t|
    t.integer "item_id"
    t.string  "marca"
    t.string  "modelo"
    t.string  "descripcion_general"
    t.string  "materia"
    t.string  "funcion"
    t.string  "ubicacion"
    t.string  "aplicacion"
    t.string  "observaciones"
    t.integer "specification_id"
    t.string  "equipo"
    t.string  "material_consumible"
    t.string  "servicio"
    t.string  "licencia"
    t.string  "repuesto"
    t.string  "renovacion_licencia"
    t.string  "accesorio"
    t.string  "otro"
    t.decimal "alto"
    t.decimal "ancho"
    t.decimal "largo"
    t.decimal "peso"
    t.string  "dimensiones_alto"
    t.string  "dimensiones_ancho"
    t.string  "dimensiones_largo"
    t.string  "dimensiones_peso"
  end

  create_table "requests", force: true do |t|
    t.string  "unidad_solicitante"
    t.string  "persona_contacto"
    t.string  "telefono"
    t.string  "email"
    t.string  "fondos"
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
    t.integer "specification_id"
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
    t.string   "attachment"
    t.integer  "specification_id"
  end

  create_table "servicerequests", force: true do |t|
    t.string   "seccion"
    t.string   "contacto_int"
    t.string   "correo_int"
    t.string   "extension"
    t.string   "monto"
    t.text     "observacion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_id"
    t.integer  "specification_id"
    t.datetime "fecha"
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
    t.string   "nacional"
    t.integer  "p8"
    t.integer  "p9"
    t.string   "modalidad"
  end

  create_table "table_items_solicituds", force: true do |t|
    t.integer  "codItem"
    t.integer  "codSolicitud"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tools", force: true do |t|
    t.string   "name"
    t.string   "brand"
    t.integer  "national_good"
    t.string   "status"
    t.string   "responsible"
    t.string   "location"
    t.string   "material"
    t.string   "bill"
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
    t.string   "dependency"
    t.boolean  "solicitados"
    t.string   "id2"
    t.string   "tipo"
    t.string   "origen"
    t.string   "NumDonacion"
    t.string   "FechaDonacion"
    t.string   "PJDonacion"
    t.string   "PersonaContactoDonacion"
    t.string   "correo"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "technician"
    t.boolean  "labBoss"
    t.boolean  "director"
    t.boolean  "acquisition"
    t.boolean  "acquisition_analist"
    t.boolean  "import_analist"
    t.boolean  "import"
    t.boolean  "manage"
    t.boolean  "manage_analist"
    t.boolean  "quality_analist"
    t.boolean  "quality"
    t.boolean  "gsmp"
    t.boolean  "directorate"
    t.boolean  "labassistant"
    t.boolean  "section_boss"
    t.boolean  "proy_responsible"
    t.boolean  "external"
    t.string   "name"
    t.string   "surname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
