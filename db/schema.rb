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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110411020619) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.date     "last_import_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ofx_ORG"
    t.string   "ofx_FI"
    t.string   "ofx_ACCTID"
    t.decimal  "balance",          :precision => 8, :scale => 2
    t.string   "type"
  end

  create_table "payees", :force => true do |t|
    t.string   "name"
    t.string   "friendly_name"
    t.string   "last_tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "transactions", :force => true do |t|
    t.date     "date"
    t.string   "payee"
    t.decimal  "amount",     :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid"
    t.integer  "account_id"
    t.integer  "payee_id"
  end

end
