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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20180225153357) do

  create_table "guides", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_guides_on_email", unique: true
    t.index ["reset_password_token"], name: "index_guides_on_reset_password_token", unique: true
  end

  create_table "tours", force: :cascade do |t|
    t.integer "price"
    t.integer "duration"
    t.integer "max_persons"
    t.string "title"
    t.string "description"
    t.string "city"
    t.boolean "is_outdoors"
    t.boolean "is_nightlife"
    t.boolean "is_foodie"
    t.boolean "is_daytrip"
    t.boolean "is_landmarks"
    t.boolean "is_museums"
    t.boolean "active"
    t.integer "guide_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guide_id"], name: "index_tours_on_guide_id"
  end
=======
ActiveRecord::Schema.define(version: 20180225173149) do
>>>>>>> 7fbc3d80a6dc7177b670ed95674b62b34f723376

  create_table "guides", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstname"
    t.string "lastname"
    t.string "phone_number"
    t.text "description"
    t.index ["email"], name: "index_guides_on_email", unique: true
    t.index ["reset_password_token"], name: "index_guides_on_reset_password_token", unique: true
  end

  create_table "travelers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstname"
    t.string "lastname"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "provider"
    t.string "uid"
    t.string "image"
    t.string "phone_number"
    t.text "description"
    t.index ["confirmation_token"], name: "index_travelers_on_confirmation_token", unique: true
    t.index ["email"], name: "index_travelers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_travelers_on_reset_password_token", unique: true
  end

end
