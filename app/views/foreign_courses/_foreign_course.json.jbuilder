json.extract! foreign_course, :id, :instrutor, :tamu_department_id, :foreign_course_name, :credit_hours, :university_id, :semester_approved, :created_at, :updated_at
json.url foreign_course_url(foreign_course, format: :json)
