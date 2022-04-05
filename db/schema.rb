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



  create_table "courses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "classification"
    t.string "class_period_day_of_week"
    t.integer "class_period_timetable"
    t.integer "credit"
    t.string "professor"
    t.float "difficulity"
    t.float "fun"
    t.float "pass_rate"
    t.integer "ratio_exam"
    t.integer "ratio_attendance"
    t.string "necessity_of_attendance"
    t.integer "number_of_reviews"
  end

  create_table "labs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "classification"
    t.string "major"
    t.integer "core_time_start_hour"
    t.integer "core_time_start_min"
    t.integer "core_time_end_hour"
    t.integer "core_time_end_min"
    t.string "professor"
    t.float "difficulity"
    t.float "fun"
    t.integer "number_of_reviews"
  end

  create_table "requests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.text "content"
    t.string "user_name"
    t.string "email"
  end

  create_table "review_courses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.integer "course_id"
    t.integer "difficulity"
    t.integer "fun"
    t.integer "grade"
    t.string "attendance"
    t.text "free_review"
  end

  create_table "review_labs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.integer "lab_id"
    t.integer "difficulity"
    t.integer "fun"
    t.integer "core_time_start_hour"
    t.integer "core_time_start_min"
    t.integer "core_time_end_hour"
    t.integer "core_time_end_min"
    t.text "free_review"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
  end

end
