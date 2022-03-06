# frozen_string_literal: true

json.array! @foreign_courses, partial: 'foreign_courses/foreign_course', as: :foreign_course
