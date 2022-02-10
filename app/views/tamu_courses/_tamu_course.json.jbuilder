json.extract! tamu_course, :id, :tamu_department_id, :course_num, :created_at, :updated_at
json.url tamu_course_url(tamu_course, format: :json)
