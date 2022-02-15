# frozen_string_literal: true

json.array! @courses_students, partial: 'courses_students/courses_student', as: :courses_student
