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

ActiveRecord::Schema.define(version: 20161104212052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "vin",          limit: 17
    t.integer  "mileage"
    t.integer  "year"
    t.string   "make"
    t.string   "model"
    t.string   "color"
    t.string   "transmission"
    t.string   "engine"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "issues", force: :cascade do |t|
    t.integer  "car_id"
    t.string   "title",       limit: 64
    t.string   "description"
    t.boolean  "open",                   default: false
    t.integer  "urgency",                default: 1
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "maintenances", force: :cascade do |t|
    t.integer  "car_id"
    t.string   "title",          limit: 64
    t.string   "description"
    t.integer  "mileage"
    t.integer  "mechanic_id"
    t.date     "date_completed"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "repairs", force: :cascade do |t|
    t.integer  "issue_id"
    t.string   "title",          limit: 64
    t.string   "description"
    t.integer  "mileage"
    t.integer  "mechanic_id"
    t.date     "date_completed"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 64
    t.string   "last_name",              limit: 64
    t.string   "phone",                             default: ""
    t.boolean  "mech_status",                       default: false
    t.string   "zip_code",                          default: ""
    t.string   "email",                             default: "",    null: false
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
