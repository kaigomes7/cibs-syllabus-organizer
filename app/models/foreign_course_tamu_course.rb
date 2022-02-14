class ForeignCourseTamuCourse < ApplicationRecord
  validates :foreign_course_id, :tamu_course_id, presence: true
  belongs_to :foreign_course
  belongs_to :tamu_course
end
