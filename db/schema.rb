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

ActiveRecord::Schema.define(version: 20190102221435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activity_classes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "actus", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "photo"
    t.date     "edition"
    t.string   "link"
    t.string   "description"
    t.boolean  "billboard"
  end

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "photo"
    t.integer  "year_of_creation"
    t.string   "city"
    t.integer  "number_of_musicians"
    t.integer  "user_id"
    t.boolean  "signed",              default: false
    t.string   "contact"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "genre_id"
    t.boolean  "bookable",            default: false
    t.integer  "county_id"
    t.index ["county_id"], name: "index_artists_on_county_id", using: :btree
    t.index ["genre_id"], name: "index_artists_on_genre_id", using: :btree
    t.index ["user_id"], name: "index_artists_on_user_id", using: :btree
  end

  create_table "assos", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "photo"
    t.string   "facebook_page"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_id"
    t.integer  "genre_id"
    t.integer  "year_of_creation"
    t.string   "description"
    t.integer  "activity_id"
    t.string   "phone_number"
    t.integer  "number_of_musicians_max", default: 9
    t.integer  "county_id"
    t.integer  "activity_class_id"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.index ["activity_class_id"], name: "index_assos_on_activity_class_id", using: :btree
    t.index ["activity_id"], name: "index_assos_on_activity_id", using: :btree
    t.index ["county_id"], name: "index_assos_on_county_id", using: :btree
    t.index ["genre_id"], name: "index_assos_on_genre_id", using: :btree
    t.index ["user_id"], name: "index_assos_on_user_id", using: :btree
  end

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "bandcamps", force: :cascade do |t|
    t.string   "link"
    t.integer  "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_bandcamps_on_artist_id", using: :btree
  end

  create_table "bios", force: :cascade do |t|
    t.text     "content"
    t.integer  "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_bios_on_artist_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "topic_id"
    t.integer  "user_id"
    t.index ["topic_id"], name: "index_comments_on_topic_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "contacts", force: :cascade do |t|
    t.text     "content"
    t.integer  "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["artist_id"], name: "index_contacts_on_artist_id", using: :btree
    t.index ["user_id"], name: "index_contacts_on_user_id", using: :btree
  end

  create_table "counties", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facebooks", force: :cascade do |t|
    t.string   "link"
    t.integer  "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_facebooks_on_artist_id", using: :btree
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hardwares", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "photo"
    t.integer  "number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "place_id"
    t.index ["place_id"], name: "index_hardwares_on_place_id", using: :btree
  end

  create_table "instagrams", force: :cascade do |t|
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "artist_id"
    t.index ["artist_id"], name: "index_instagrams_on_artist_id", using: :btree
  end

  create_table "instrument_hirings", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "instrument_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["artist_id"], name: "index_instrument_hirings_on_artist_id", using: :btree
    t.index ["instrument_id"], name: "index_instrument_hirings_on_instrument_id", using: :btree
  end

  create_table "instrument_playings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "instrument_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["instrument_id"], name: "index_instrument_playings_on_instrument_id", using: :btree
    t.index ["user_id"], name: "index_instrument_playings_on_user_id", using: :btree
  end

  create_table "instruments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["artist_id"], name: "index_messages_on_artist_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id",            null: false
    t.integer  "actor_id"
    t.string   "notify_type",        null: false
    t.string   "target_type"
    t.integer  "target_id"
    t.string   "second_target_type"
    t.integer  "second_target_id"
    t.string   "third_target_type"
    t.integer  "third_target_id"
    t.datetime "read_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["user_id", "notify_type"], name: "index_notifications_on_user_id_and_notify_type", using: :btree
    t.index ["user_id"], name: "index_notifications_on_user_id", using: :btree
  end

  create_table "opinions", force: :cascade do |t|
    t.integer  "heart"
    t.integer  "mic"
    t.integer  "note"
    t.integer  "release_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["release_id"], name: "index_opinions_on_release_id", using: :btree
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
    t.string   "name"
    t.datetime "end_time"
    t.integer  "type_id"
    t.integer  "asso_id"
    t.integer  "place_id"
    t.index ["artist_id"], name: "index_performances_on_artist_id", using: :btree
    t.index ["asso_id"], name: "index_performances_on_asso_id", using: :btree
    t.index ["place_id"], name: "index_performances_on_place_id", using: :btree
    t.index ["type_id"], name: "index_performances_on_type_id", using: :btree
    t.index ["user_id"], name: "index_performances_on_user_id", using: :btree
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "photo"
    t.string   "facebook_page"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_id"
    t.integer  "genre_id"
    t.string   "address"
    t.integer  "number_of_musicians_max", default: 4
    t.integer  "county_id"
    t.integer  "activity_class_id"
    t.string   "phone_number"
    t.float    "latitude"
    t.float    "longitude"
    t.index ["activity_class_id"], name: "index_places_on_activity_class_id", using: :btree
    t.index ["county_id"], name: "index_places_on_county_id", using: :btree
    t.index ["genre_id"], name: "index_places_on_genre_id", using: :btree
    t.index ["user_id"], name: "index_places_on_user_id", using: :btree
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "beer"
    t.integer  "crowd"
    t.integer  "star"
    t.integer  "crown"
    t.integer  "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "one_word"
    t.index ["artist_id"], name: "index_ratings_on_artist_id", using: :btree
  end

  create_table "records", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "releases", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "record_id"
    t.string   "photo"
    t.text     "description"
    t.integer  "price"
    t.string   "bandcamp_link"
    t.string   "youtube_link"
    t.integer  "genre_id"
    t.integer  "artist_id"
    t.boolean  "signed",           default: false
    t.integer  "year_of_creation"
    t.boolean  "production",       default: false
    t.index ["artist_id"], name: "index_releases_on_artist_id", using: :btree
    t.index ["genre_id"], name: "index_releases_on_genre_id", using: :btree
    t.index ["record_id"], name: "index_releases_on_record_id", using: :btree
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "adhesion_fee"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "asso_id"
    t.string   "photo"
    t.index ["asso_id"], name: "index_services_on_asso_id", using: :btree
  end

  create_table "shops", force: :cascade do |t|
    t.integer  "price"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "product"
    t.string   "photo"
  end

  create_table "soundclouds", force: :cascade do |t|
    t.string   "link"
    t.integer  "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_soundclouds_on_artist_id", using: :btree
  end

  create_table "topics", force: :cascade do |t|
    t.string   "title"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "content"
    t.index ["user_id"], name: "index_topics_on_user_id", using: :btree
  end

  create_table "twitters", force: :cascade do |t|
    t.string   "link"
    t.integer  "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_twitters_on_artist_id", using: :btree
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_genres", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_user_genres_on_genre_id", using: :btree
    t.index ["user_id"], name: "index_user_genres_on_user_id", using: :btree
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
    t.string   "city"
    t.boolean  "admin",                  default: false, null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.boolean  "fiveties",               default: false
    t.boolean  "sixties",                default: false
    t.boolean  "seventies",              default: false
    t.boolean  "eighties",               default: false
    t.boolean  "production",             default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "videos", force: :cascade do |t|
    t.string   "title"
    t.string   "youtube_link"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "artist_id"
    t.integer  "genre_id"
    t.integer  "asso_id"
    t.integer  "place_id"
    t.boolean  "signed",       default: false
    t.index ["artist_id"], name: "index_videos_on_artist_id", using: :btree
    t.index ["asso_id"], name: "index_videos_on_asso_id", using: :btree
    t.index ["genre_id"], name: "index_videos_on_genre_id", using: :btree
    t.index ["place_id"], name: "index_videos_on_place_id", using: :btree
  end

  create_table "youtubes", force: :cascade do |t|
    t.string   "link"
    t.integer  "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_youtubes_on_artist_id", using: :btree
  end

  add_foreign_key "artists", "counties"
  add_foreign_key "artists", "genres"
  add_foreign_key "artists", "users"
  add_foreign_key "assos", "activities"
  add_foreign_key "assos", "activity_classes"
  add_foreign_key "assos", "counties"
  add_foreign_key "assos", "genres"
  add_foreign_key "assos", "users"
  add_foreign_key "bandcamps", "artists"
  add_foreign_key "bios", "artists"
  add_foreign_key "comments", "topics"
  add_foreign_key "comments", "users"
  add_foreign_key "contacts", "artists"
  add_foreign_key "contacts", "users"
  add_foreign_key "facebooks", "artists"
  add_foreign_key "hardwares", "places"
  add_foreign_key "instagrams", "artists"
  add_foreign_key "instrument_hirings", "artists"
  add_foreign_key "instrument_hirings", "instruments"
  add_foreign_key "instrument_playings", "instruments"
  add_foreign_key "instrument_playings", "users"
  add_foreign_key "messages", "artists"
  add_foreign_key "messages", "users"
  add_foreign_key "opinions", "releases"
  add_foreign_key "performances", "artists"
  add_foreign_key "performances", "assos"
  add_foreign_key "performances", "places"
  add_foreign_key "performances", "types"
  add_foreign_key "performances", "users"
  add_foreign_key "places", "activity_classes"
  add_foreign_key "places", "counties"
  add_foreign_key "places", "genres"
  add_foreign_key "places", "users"
  add_foreign_key "ratings", "artists"
  add_foreign_key "releases", "artists"
  add_foreign_key "releases", "genres"
  add_foreign_key "releases", "records"
  add_foreign_key "services", "assos"
  add_foreign_key "soundclouds", "artists"
  add_foreign_key "topics", "users"
  add_foreign_key "twitters", "artists"
  add_foreign_key "user_genres", "genres"
  add_foreign_key "user_genres", "users"
  add_foreign_key "videos", "artists"
  add_foreign_key "videos", "assos"
  add_foreign_key "videos", "genres"
  add_foreign_key "videos", "places"
  add_foreign_key "youtubes", "artists"
end
