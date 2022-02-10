class ForeignCoursesTamuCourse < ApplicationRecord
    belongs_to :foreign_course
    belongs_to :tamu_course
end
