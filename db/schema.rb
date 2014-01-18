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

ActiveRecord::Schema.define(version: 20140109224841) do

  create_table "adies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "adatar"
    t.string   "password_digest"
  end

  create_table "problems", force: true do |t|
    t.string   "type"
    t.string   "description"
    t.string   "estimate"
    t.integer  "adie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "helped",      default: "needs help"
  end

  create_table "ratings", force: true do |t|
    t.string   "helper"
    t.integer  "rating"
    t.text     "solution"
    t.integer  "satisfaction"
    t.integer  "problem_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
