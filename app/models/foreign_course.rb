# frozen_string_literal: true

class ForeignCourse < ApplicationRecord
<<<<<<< HEAD
=======
  validates :instrutor, :foreign_course_name, :credit_hours, :semester_approved, presence: true
>>>>>>> lance-rspec
  belongs_to :tamu_department
  belongs_to :university
  has_and_belongs_to_many :student
  has_and_belongs_to_many :tamu_course
end
