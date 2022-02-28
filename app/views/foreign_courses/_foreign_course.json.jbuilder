json.extract! foreign_course, :id, :instrutor, :foreign_course_name, :credit_hours, :semester_approved, :tamu_department_id, :university_id, :created_at, :updated_at
json.url foreign_course_url(foreign_course, format: :json)
