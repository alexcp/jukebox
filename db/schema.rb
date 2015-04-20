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

ActiveRecord::Schema.define(version: 20150420200145) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "artists", ["name"], name: "index_artists_on_name", using: :btree

  create_table "artists_concerts", force: :cascade do |t|
    t.integer  "artist_id",  null: false
    t.integer  "concert_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "artists_concerts", ["artist_id"], name: "index_artists_concerts_on_artist_id", using: :btree
  add_index "artists_concerts", ["concert_id"], name: "index_artists_concerts_on_concert_id", using: :btree

  create_table "concerts", force: :cascade do |t|
    t.date     "date",             null: false
    t.time     "time",             null: false
    t.integer  "price"
    t.integer  "venue_id",         null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "additionnal_info"
  end

  add_index "concerts", ["date"], name: "index_concerts_on_date", using: :btree
  add_index "concerts", ["venue_id"], name: "index_concerts_on_venue_id", using: :btree

  create_table "queue_classic_jobs", id: :bigserial, force: :cascade do |t|
    t.text     "q_name",                       null: false
    t.text     "method",                       null: false
    t.json     "args",                         null: false
    t.datetime "locked_at"
    t.integer  "locked_by"
    t.datetime "created_at", default: "now()"
  end

  add_index "queue_classic_jobs", ["q_name", "id"], name: "idx_qc_on_name_only_unlocked", where: "(locked_at IS NULL)", using: :btree

  create_table "tracks", force: :cascade do |t|
    t.integer  "artist_id"
    t.string   "url",        null: false
    t.text     "embed_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tracks", ["artist_id"], name: "index_tracks_on_artist_id", using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "venues", ["name"], name: "index_venues_on_name", using: :btree

end
