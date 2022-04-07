# frozen_string_literal: true

json.extract! foreign_courses_tamu_course, :id, :foreign_course_id, :tamu_course, :created_at, :updated_at
json.url foreign_courses_tamu_course_url(foreign_courses_tamu_course, format: :json)
