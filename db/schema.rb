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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130830050212) do

  create_table "auctions", :force => true do |t|
    t.string   "service"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "patient_id"
  end

  add_index "auctions", ["patient_id"], :name => "index_auctions_on_patient_id"

  create_table "bids", :force => true do |t|
    t.decimal  "maximum_bid",       :precision => 8, :scale => 2
    t.decimal  "lowest_bid",        :precision => 8, :scale => 2
    t.text     "additional_offers"
    t.integer  "auction_id"
    t.datetime "created_at",                                                         :null => false
    t.datetime "updated_at",                                                         :null => false
    t.integer  "doctor_id"
    t.boolean  "accepted",                                        :default => false
  end

  add_index "bids", ["auction_id"], :name => "index_bids_on_auction_id"
  add_index "bids", ["doctor_id"], :name => "index_bids_on_doctor_id"

  create_table "doctors", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "doctors", ["email"], :name => "index_doctors_on_email", :unique => true
  add_index "doctors", ["reset_password_token"], :name => "index_doctors_on_reset_password_token", :unique => true

  create_table "patients", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "patients", ["email"], :name => "index_patients_on_email", :unique => true
  add_index "patients", ["reset_password_token"], :name => "index_patients_on_reset_password_token", :unique => true

  create_table "permissions", :force => true do |t|
    t.integer  "patient_id"
    t.integer  "thing_id"
    t.string   "thing_type"
    t.string   "action"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
