# frozen_string_literal: true

class ForeignCourseTamuCourse < ApplicationRecord
  belongs_to :foreign_course
  belongs_to :tamu_course
end
