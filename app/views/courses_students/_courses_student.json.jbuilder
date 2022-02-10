json.extract! courses_student, :id, :student_id, :course_id, :created_at, :updated_at
json.url courses_student_url(courses_student, format: :json)
