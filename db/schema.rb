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

ActiveRecord::Schema.define(version: 20171030105434) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actus", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "photo"
    t.date     "edition"
    t.string   "link"
  end

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "photo"
    t.integer  "year_of_creation"
    t.string   "city"
    t.integer  "number_of_musicians"
    t.string   "facebook_link"
    t.string   "insta_link"
    t.string   "youtube_channel"
    t.string   "soundcloud_link"
    t.string   "twitter_link"
    t.integer  "user_id"
    t.boolean  "signed",              default: false
    t.string   "contact"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "bandcamp_link"
    t.integer  "genre_id"
    t.index ["genre_id"], name: "index_artists_on_genre_id", using: :btree
    t.index ["user_id"], name: "index_artists_on_user_id", using: :btree
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "performances", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "city"
    t.integer  "price"
    t.string   "place_address"
    t.string   "facebook_event"
    t.string   "photo"
    t.integer  "user_id"
    t.integer  "artist_id"
    t.index ["artist_id"], name: "index_performances_on_artist_id", using: :btree
    t.index ["user_id"], name: "index_performances_on_user_id", using: :btree
  end

  create_table "records", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "releases", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "record_id"
    t.string   "photo"
    t.text     "description"
    t.integer  "price"
    t.string   "bandcamp_link"
    t.string   "youtube_link"
    t.integer  "user_id"
    t.datetime "year_of_creation"
    t.integer  "genre_id"
    t.index ["genre_id"], name: "index_releases_on_genre_id", using: :btree
    t.index ["record_id"], name: "index_releases_on_record_id", using: :btree
    t.index ["user_id"], name: "index_releases_on_user_id", using: :btree
  end

  create_table "shops", force: :cascade do |t|
    t.integer  "price"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "product"
    t.string   "photo"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.text     "description"
    t.string   "city"
    t.boolean  "admin",                  default: false, null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "artists", "genres"
  add_foreign_key "artists", "users"
  add_foreign_key "performances", "artists"
  add_foreign_key "performances", "users"
  add_foreign_key "releases", "genres"
  add_foreign_key "releases", "records"
  add_foreign_key "releases", "users"
end
