# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_10_024806) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "instrutor"
    t.integer "tamu_department_id"
    t.string "f_course_name"
    t.integer "credit_hours"
    t.integer "university_id"
    t.string "semester_approved"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses_students", force: :cascade do |t|
    t.integer "student_id"
    t.integer "course_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "foreign_courses", force: :cascade do |t|
    t.string "instrutor"
    t.integer "tamu_department_id"
    t.string "foreign_course_name"
    t.integer "credit_hours"
    t.integer "university_id"
    t.string "semester_approved"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "foreign_courses_tamu_courses", force: :cascade do |t|
    t.integer "foreign_course_id"
    t.integer "tamu_course_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviewers", force: :cascade do |t|
    t.string "reviewer_email"
    t.integer "tamu_department_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "student_email"
    t.integer "tamu_department_id"
    t.string "student_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tamu_courses", force: :cascade do |t|
    t.integer "tamu_department_id"
    t.integer "course_num"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tamu_departments", force: :cascade do |t|
    t.string "tamu_department_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "universities", force: :cascade do |t|
    t.string "country"
    t.string "university_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
