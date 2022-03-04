class ForeignCoursesStudent < ApplicationRecord
  belongs_to :foreign_course
  belongs_to :student
end
