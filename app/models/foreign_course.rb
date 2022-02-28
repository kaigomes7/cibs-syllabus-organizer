class ForeignCourse < ApplicationRecord
  validates :instructor, :foreign_course_name, :credit_hours, :semester_approved, presence: true
  belongs_to :tamu_department
  belongs_to :university
  has_and_belongs_to_many :student
  has_and_belongs_to_many :tamu_course
end
