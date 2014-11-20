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

ActiveRecord::Schema.define(version: 20141120045818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "component_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components", force: true do |t|
    t.string   "name"
    t.decimal  "cost",              precision: 12, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "component_type_id"
  end

  add_index "components", ["component_type_id"], name: "index_components_on_component_type_id", using: :btree

  create_table "ingredients", force: true do |t|
    t.integer  "product_id"
    t.integer  "component_id"
    t.integer  "count"
    t.decimal  "unit_cost",    precision: 12, scale: 3
    t.decimal  "total_cost",   precision: 12, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingredients", ["component_id"], name: "index_ingredients_on_component_id", using: :btree
  add_index "ingredients", ["product_id"], name: "index_ingredients_on_product_id", using: :btree

  create_table "materials", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prices", force: true do |t|
    t.string   "name"
    t.decimal  "multiple",   precision: 12, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_lines", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_sets", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_line_id"
  end

  add_index "product_sets", ["product_line_id"], name: "index_product_sets_on_product_line_id", using: :btree

  create_table "products", force: true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.decimal  "cost_price",     precision: 12, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "material_id"
    t.integer  "product_set_id"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["material_id"], name: "index_products_on_material_id", using: :btree
  add_index "products", ["product_set_id"], name: "index_products_on_product_set_id", using: :btree

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
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
