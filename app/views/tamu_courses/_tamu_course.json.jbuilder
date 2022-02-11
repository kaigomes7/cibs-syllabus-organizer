json.extract! tamu_course, :id, :course_num, :tamu_department_id, :created_at, :updated_at
json.url tamu_course_url(tamu_course, format: :json)
