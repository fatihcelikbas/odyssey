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

ActiveRecord::Schema.define(version: 20180319052423) do

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "traveler_id"
    t.integer "conversation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "context"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["traveler_id"], name: "index_messages_on_traveler_id"
  end

  create_table "photos", force: :cascade do |t|
    t.integer "tour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["tour_id"], name: "index_photos_on_tour_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "traveler_id"
    t.integer "tour_id"
    t.datetime "start_date"
    t.integer "price"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "duration"
    t.integer "status", default: 0
    t.index ["tour_id"], name: "index_reservations_on_tour_id"
    t.index ["traveler_id"], name: "index_reservations_on_traveler_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.integer "star", default: 1
    t.integer "reservation_id"
    t.integer "tourist_id"
    t.integer "guide_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tour_id"
    t.index ["guide_id"], name: "index_reviews_on_guide_id"
    t.index ["reservation_id"], name: "index_reviews_on_reservation_id"
    t.index ["tour_id"], name: "index_reviews_on_tour_id"
    t.index ["tourist_id"], name: "index_reviews_on_tourist_id"
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
    t.integer "traveler_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.integer "instant", default: 1
    t.index ["traveler_id"], name: "index_tours_on_traveler_id"
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
    t.string "languages", default: "{English}"
    t.index ["confirmation_token"], name: "index_travelers_on_confirmation_token", unique: true
    t.index ["email"], name: "index_travelers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_travelers_on_reset_password_token", unique: true
  end

end
