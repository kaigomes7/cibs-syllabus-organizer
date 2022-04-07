# frozen_string_literal: true

class TamuCourse < ApplicationRecord
  validates :course_num, :course_name, presence: true
  belongs_to :tamu_department
  # has_and_belongs_to_many :foreign_course
end
