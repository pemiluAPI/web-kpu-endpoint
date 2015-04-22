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

ActiveRecord::Schema.define(version: 20150422070516) do

  create_table "accumulations", force: true do |t|
    t.integer "category_id"
    t.integer "province_id"
    t.string  "value"
  end

  add_index "accumulations", ["category_id"], name: "index_accumulations_on_category_id", using: :btree
  add_index "accumulations", ["province_id"], name: "index_accumulations_on_province_id", using: :btree

  create_table "categories", force: true do |t|
    t.string "description"
  end

  create_table "provinces", force: true do |t|
    t.string  "nama"
    t.string  "nama_lengkap"
    t.string  "nama_inggris"
    t.integer "jumlah_kursi"
    t.integer "jumlah_penduduk"
    t.integer "pro_id"
  end

  create_table "web_addresses", force: true do |t|
    t.integer "province_id"
    t.string  "name"
    t.string  "link"
    t.string  "other_link"
    t.string  "explanation"
  end

  add_index "web_addresses", ["province_id"], name: "index_web_addresses_on_province_id", using: :btree

end
