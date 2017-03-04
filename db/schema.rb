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

ActiveRecord::Schema.define(version: 20170304120051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "rating"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
  end

  create_table "core_box_access_tokens", force: :cascade do |t|
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "person_id"
    t.index ["person_id"], name: "index_core_box_access_tokens_on_person_id", using: :btree
  end

  create_table "core_box_people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_hash"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "core_box_person_projects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "person_id"
    t.integer  "project_id"
    t.index ["person_id"], name: "index_core_box_person_projects_on_person_id", using: :btree
    t.index ["project_id"], name: "index_core_box_person_projects_on_project_id", using: :btree
  end

  create_table "core_box_person_roles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "person_id"
    t.integer  "role_id"
    t.index ["person_id"], name: "index_core_box_person_roles_on_person_id", using: :btree
    t.index ["role_id"], name: "index_core_box_person_roles_on_role_id", using: :btree
  end

  create_table "core_box_projects", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "core_box_roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedback_identifiers", force: :cascade do |t|
    t.string   "token"
    t.integer  "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_feedback_identifiers_on_topic_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "question_type"
    t.text     "content"
    t.integer  "topic_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["topic_id"], name: "index_questions_on_topic_id", using: :btree
  end

  create_table "suggestions", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.integer  "rating_scale"
    t.datetime "expiry_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "description"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "questions", "topics"
end
