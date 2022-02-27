class ForeignCoursesStudent < ApplicationRecord
    belongs_to :student
    belongs_to :foreign_course
end
