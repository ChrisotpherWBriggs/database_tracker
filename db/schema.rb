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

ActiveRecord::Schema.define(version: 20180329114634) do

  create_table "archive2016s", force: :cascade do |t|
    t.string "lName"
    t.string "fName"
    t.integer "bDate"
    t.integer "groupId"
    t.integer "sDate"
    t.string "drug"
    t.decimal "planPaid"
    t.decimal "coPay"
    t.decimal "totalPaid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "archive2017s", force: :cascade do |t|
    t.string "lName"
    t.string "fName"
    t.integer "bDate"
    t.integer "groupId"
    t.integer "sDate"
    t.string "drug"
    t.decimal "planPaid"
    t.decimal "coPay"
    t.decimal "totalPaid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "claims", force: :cascade do |t|
    t.string "lName"
    t.string "fName"
    t.date "bDate"
    t.integer "groupId"
    t.date "sDate"
    t.string "drug"
    t.decimal "planPaid"
    t.decimal "coPay"
    t.decimal "totalPaid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "birth_date"
    t.string "service_date"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wellmonts", force: :cascade do |t|
    t.string "lName"
    t.string "fName"
    t.date "bDate"
    t.integer "groupId"
    t.date "sDate"
    t.string "drug"
    t.decimal "planPaid"
    t.decimal "coPay"
    t.decimal "totalPaid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "birth_date"
    t.string "service_date"
  end

end
