# frozen_string_literal: true

json.extract! foreign_course, :id, :instructor, :foreign_course_name, :credit_hours, :semester_approved,
              :tamu_department_id, :university_id, :created_at, :updated_at
json.url foreign_course_url(foreign_course, format: :json)
