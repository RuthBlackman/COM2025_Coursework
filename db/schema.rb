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

ActiveRecord::Schema.define(version: 2021_11_23_203208) do

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

end
