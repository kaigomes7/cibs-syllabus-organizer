class ForeignCoursesStudent < ApplicationRecord
  validates :student_id, :foreign_course_id, :admin_course_approval, :start_date, :end_date, presence: true
  belongs_to :student
  belongs_to :foreign_course
end
