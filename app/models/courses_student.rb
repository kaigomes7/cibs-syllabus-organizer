# frozen_string_literal: true

class CoursesStudent < ApplicationRecord
  belongs_to :student
  belongs_to :foreign_course
end
