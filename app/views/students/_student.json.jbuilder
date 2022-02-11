json.extract! student, :id, :student_email, :student_name, :tamu_department_id, :created_at, :updated_at
json.url student_url(student, format: :json)
