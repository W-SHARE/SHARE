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

ActiveRecord::Schema.define(version: 2022_04_16_173208) do

  create_table "courses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "classification_1"
    t.string "class_period_day_of_week"
    t.integer "class_period_timetable"
    t.integer "credit"
    t.string "professor"
    t.float "average_difficulity"
    t.float "average_fun"
    t.float "pass_rate"
    t.integer "ratio_exam"
    t.integer "ratio_attendance"
    t.string "necessity_of_attendance"
    t.integer "number_of_reviews"
    t.string "image_professor"
    t.integer "ratio_assignment"
    t.string "image_background"
    t.string "syllabus_url"
    t.string "textbook"
    t.float "average_overall"
    t.string "classification_2"
    t.string "school_grade"
    t.string "class_period_semester"
    t.string "image_icon"
    t.string "classroom"
    t.string "campus"
    t.string "school"
    t.string "department"
  end

