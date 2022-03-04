json.extract! foreign_course, :id, :tamu_department_id, :foreign_course_name, :contact_hours, :semester_approved, :foreign_course_dept, :foreign_course_num, :course_approval_status, :created_at, :updated_at
json.url foreign_course_url(foreign_course, format: :json)
