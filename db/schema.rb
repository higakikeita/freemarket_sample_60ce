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

ActiveRecord::Schema.define(version: 20200119082708) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "postal_code", null: false
    t.integer  "prefecture",  null: false
    t.string   "city",        null: false
    t.string   "address",     null: false
    t.string   "apartment"
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "creditcards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "card_company", null: false
    t.string   "card_number",  null: false
    t.integer  "card_year",    null: false
    t.integer  "card_month",   null: false
    t.integer  "card_pass",    null: false
    t.integer  "user_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_creditcards_on_user_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "product_image", limit: 65535, null: false
    t.integer  "product_id",                  null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["product_id"], name: "index_images_on_product_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",          limit: 191
    t.integer  "price"
    t.text     "explain",       limit: 65535
    t.integer  "postage"
    t.string   "region"
    t.string   "status"
    t.date     "shipping_date"
    t.integer  "size"
    t.integer  "brand_id"
    t.integer  "category_id"
    t.string   "product"
    t.string   "image"
    t.string   "prefecture"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["name"], name: "index_products_on_name", using: :btree
    t.index ["price"], name: "index_products_on_price", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.text     "avatar",                 limit: 65535
    t.text     "introduction",           limit: 65535
    t.string   "first_name",                                        null: false
    t.string   "last_name",                                         null: false
    t.string   "first_name_kana",                                   null: false
    t.string   "last_name_kana",                                    null: false
    t.integer  "user_id",                                           null: false
    t.date     "birthday",                                          null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "nickname"
    t.index ["user_id"], name: "index_users_on_user_id", using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "creditcards", "users"
  add_foreign_key "images", "products"
  add_foreign_key "users", "users"
end
