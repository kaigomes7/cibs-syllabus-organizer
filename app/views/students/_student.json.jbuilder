json.extract! student, :id, :student_email, :tamu_department_id, :student_name, :created_at, :updated_at
json.url student_url(student, format: :json)
