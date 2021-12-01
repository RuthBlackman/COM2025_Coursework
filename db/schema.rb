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

ActiveRecord::Schema.define(version: 2021_11_30_214957) do

  create_table "course_modules", force: :cascade do |t|
    t.string "Title", null: false
    t.string "ModuleCode", null: false
    t.text "ModuleOverview", null: false
    t.string "ModuleLeader", null: false
    t.integer "ModuleLeaderID", null: false
    t.integer "Credits", null: false
    t.integer "Year", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Title"], name: "index_course_modules_on_title", unique: true
  end

  create_table "module_leaders", force: :cascade do |t|
    t.string "firstName", null: false
    t.string "lastName", null: false
    t.string "department", null: false
    t.string "office", null: false
    t.string "officeHours", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index [nil], name: "index_module_leaders_on_moduleLeaderID", unique: true
  end

  create_table "selected_modules", force: :cascade do |t|
    t.integer "StudentID", null: false
    t.integer "CourseModuleID", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
