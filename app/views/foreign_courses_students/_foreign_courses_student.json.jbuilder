json.extract! foreign_courses_student, :id, :foreign_course_id, :student_id, :admin_course_approval, :start_date, :end_date, :created_at, :updated_at
json.url foreign_courses_student_url(foreign_courses_student, format: :json)
