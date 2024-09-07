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

ActiveRecord::Schema[7.1].define(version: 2024_09_05_195252) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "about_images", force: :cascade do |t|
    t.string "image", null: false
    t.bigint "about_id"
    t.index ["about_id"], name: "index_about_images_on_about_id"
  end

  create_table "abouts", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "additional_descriptions", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id"
    t.index ["product_id"], name: "index_additional_descriptions_on_product_id"
  end

  create_table "additional_texts", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "additional_description_id"
    t.index ["additional_description_id"], name: "index_additional_texts_on_additional_description_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "product_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name_ka"
    t.string "description"
  end

  create_table "contact_infos", force: :cascade do |t|
    t.string "email"
    t.string "phone_number"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "title"
    t.string "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.text "review_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "featured_products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id"
    t.index ["product_id"], name: "index_featured_products_on_product_id"
  end

  create_table "opening_images", force: :cascade do |t|
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "opening_id"
    t.index ["opening_id"], name: "index_opening_images_on_opening_id"
  end

  create_table "openings", force: :cascade do |t|
    t.string "title"
    t.string "min_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "title_ka"
    t.string "min_title_ka"
  end

  create_table "postcards", force: :cascade do |t|
    t.string "title"
    t.string "min_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "title_ka"
    t.string "min_title_ka"
  end

  create_table "priors", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "icon_id"
  end

  create_table "product_images", force: :cascade do |t|
    t.bigint "about_id", null: false
    t.string "image"
    t.boolean "main", default: false
    t.index ["about_id"], name: "index_product_images_on_about_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title", null: false
    t.decimal "price", null: false
    t.text "description", null: false
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sale_price"
    t.integer "amount", default: 0
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shop_sliders", force: :cascade do |t|
    t.string "header"
    t.string "image"
  end

  create_table "shops", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socials", force: :cascade do |t|
    t.string "title"
    t.string "social_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "username"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "api_key"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.date "confirmation_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "about_images", "abouts"
  add_foreign_key "additional_descriptions", "products"
  add_foreign_key "additional_texts", "additional_descriptions"
  add_foreign_key "carts", "products"
  add_foreign_key "carts", "users"
  add_foreign_key "featured_products", "products"
  add_foreign_key "opening_images", "openings"
  add_foreign_key "product_images", "abouts"
  add_foreign_key "products", "categories"
end
