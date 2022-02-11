class CoursesStudent < ApplicationRecord
  belongs_to :student
  belongs_to :foreign_course
end
