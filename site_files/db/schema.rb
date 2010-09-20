# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 1) do

  create_table "clientes", :force => true do |t|
    t.integer  "tipo"
    t.string   "codigo_convite"
    t.string   "numero_agencia"
    t.string   "numero_cliente"
    t.string   "email"
    t.string   "nome"
    t.string   "telemovel"
    t.string   "morada"
    t.string   "c1_nome"
    t.boolean  "c1_tipo"
    t.boolean  "c1_transporte"
    t.boolean  "c1_alojamento"
    t.string   "c2_nome"
    t.boolean  "c2_tipo"
    t.boolean  "c2_transporte"
    t.boolean  "c2_alojamento"
    t.string   "c3_nome"
    t.boolean  "c3_tipo"
    t.boolean  "c3_transporte"
    t.boolean  "c3_alojamento"
    t.string   "aux"
    t.integer  "up_crianca"
    t.integer  "up_adulto"
    t.string   "up_alojamento"
    t.string   "up_transporte"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
