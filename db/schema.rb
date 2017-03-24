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

ActiveRecord::Schema.define(version: 20170324205353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "job_posts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "city"
    t.string   "state"
    t.integer  "views",                  default: 0
    t.string   "company"
    t.string   "additional_title"
    t.text     "additional_description"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "api_name"
    t.string   "api_id"
    t.integer  "job_type"
  end

  create_table "job_posts_skills", force: :cascade do |t|
    t.integer "job_post_id"
    t.integer "skill_id"
    t.index ["job_post_id"], name: "index_job_posts_skills_on_job_post_id", using: :btree
    t.index ["skill_id"], name: "index_job_posts_skills_on_skill_id", using: :btree
  end

  create_table "job_posts_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "job_post_id"
    t.index ["job_post_id"], name: "index_job_posts_users_on_job_post_id", using: :btree
    t.index ["user_id"], name: "index_job_posts_users_on_user_id", using: :btree
  end

  create_table "skills", force: :cascade do |t|
    t.string   "image"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "roles"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "job_posts_skills", "job_posts"
  add_foreign_key "job_posts_skills", "skills"
  add_foreign_key "job_posts_users", "job_posts"
  add_foreign_key "job_posts_users", "users"
end
