class ForeignCoursesTamuCourse < ApplicationRecord
  belongs_to :tamu_course
  belongs_to :foreign_course
end
