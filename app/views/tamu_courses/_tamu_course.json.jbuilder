# frozen_string_literal: true

json.extract! tamu_course, :id, :course_num, :tamu_department_id, :course_name, :created_at, :updated_at
json.url tamu_course_url(tamu_course, format: :json)
