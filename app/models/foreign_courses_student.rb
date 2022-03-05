class ForeignCoursesStudent < ApplicationRecord
  validates :student_id, :foreign_course_id, :start_date, :end_date, presence: true
  belongs_to :student
  belongs_to :foreign_course
end
