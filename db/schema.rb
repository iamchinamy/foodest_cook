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

ActiveRecord::Schema.define(version: 2020_10_18_061906) do

  create_table "cart_items", id: false, force: :cascade do |t|
    t.integer "id"
  end

  create_table "customers", id: false, force: :cascade do |t|
    t.integer "id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "item"
    t.string "amount"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "producer_id"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ordered_products", id: false, force: :cascade do |t|
    t.integer "id"
  end

  create_table "orders", id: false, force: :cascade do |t|
    t.integer "id"
  end

  create_table "producers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "corporate_name"
    t.string "representative"
    t.string "post_code"
    t.string "address"
    t.string "phone_number"
    t.string "producer_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "introduction"
    t.index ["email"], name: "index_producers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_producers_on_reset_password_token", unique: true
  end

  create_table "products", id: false, force: :cascade do |t|
    t.integer "id"
    t.integer "status"
  end

  create_table "recipes", force: :cascade do |t|
    t.integer "producer_id"
    t.string "recipe_image_id"
    t.string "title"
    t.text "description"
    t.string "total_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", id: false, force: :cascade do |t|
    t.integer "id"
  end

  create_table "shippings", id: false, force: :cascade do |t|
    t.integer "id"
  end

  create_table "steps", force: :cascade do |t|
    t.string "method"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
