# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_11_162507) do

  create_table "ajudantes", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "contato"
    t.float "precoMaoDeObra"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "usuario_id"
    t.index ["usuario_id"], name: "index_ajudantes_on_usuario_id"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "contato"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "enderecos", force: :cascade do |t|
    t.string "cidade"
    t.string "bairro"
    t.string "logradouro"
    t.string "complemento"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "cliente_id"
    t.index ["cliente_id"], name: "index_enderecos_on_cliente_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.float "valor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "servicos", force: :cascade do |t|
    t.string "tipoDoServico"
    t.text "descricao"
    t.date "data"
    t.float "valorDoServico"
    t.boolean "statusDePagamento"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "cliente_id"
    t.integer "usuario_id"
    t.integer "ajudante_id"
    t.integer "material_id"
    t.index ["ajudante_id"], name: "index_servicos_on_ajudante_id"
    t.index ["cliente_id"], name: "index_servicos_on_cliente_id"
    t.index ["material_id"], name: "index_servicos_on_material_id"
    t.index ["usuario_id"], name: "index_servicos_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "funcao"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "ajudantes", "usuarios"
  add_foreign_key "enderecos", "clientes"
  add_foreign_key "servicos", "ajudantes"
  add_foreign_key "servicos", "clientes"
  add_foreign_key "servicos", "materials"
  add_foreign_key "servicos", "usuarios"
end
