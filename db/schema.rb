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

ActiveRecord::Schema.define(version: 20170111233850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "healths", force: :cascade do |t|
    t.string   "status"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repos", force: :cascade do |t|
    t.string   "github_id"
    t.string   "name"
    t.string   "full_name"
    t.string   "description"
    t.boolean  "private"
    t.string   "url"
    t.string   "html_url"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["github_id"], name: "index_repos_on_github_id", using: :btree
    t.index ["name"], name: "index_repos_on_name", using: :btree
    t.index ["user_id"], name: "index_repos_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",       default: "github", null: false
    t.string   "uid",            default: "",       null: false
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.string   "provider_token"
    t.json     "provider_info"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  add_foreign_key "repos", "users"
end
