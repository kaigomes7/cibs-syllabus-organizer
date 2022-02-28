class ForeignCoursesTamuCourse < ApplicationRecord
  #not sure what this table is tbh
  belongs_to :foreign_course
  belongs_to :tamu_course
end
