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

ActiveRecord::Schema.define(version: 20170619003658) do

  create_table "biegis", force: :cascade do |t|
    t.integer "uzytkownik_id"
    t.date "data"
    t.string "nazwa"
    t.string "miejscowosc"
    t.float "dystans"
    t.string "jednostkaMiary", limit: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uzytkownik_id"], name: "index_biegis_on_uzytkownik_id"
  end

  create_table "ceny_pakietows", force: :cascade do |t|
    t.integer "biegi_id"
    t.date "data"
    t.float "cena"
    t.string "waluta", limit: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["biegi_id"], name: "index_ceny_pakietows_on_biegi_id"
  end

  create_table "uzytkowniks", force: :cascade do |t|
    t.string "imie", limit: 20
    t.string "nazwisko", limit: 60
    t.string "uzytkownik", limit: 25
    t.string "email", limit: 100, default: "", null: false
    t.string "telefon", default: "", null: false
    t.boolean "admin", default: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uzytkownik"], name: "index_uzytkowniks_on_uzytkownik"
  end

end
