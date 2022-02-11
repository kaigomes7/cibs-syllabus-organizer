class ForeignCourse < ApplicationRecord
    belongs_to :tamu_department
    belongs_to :university
    has_and_belongs_to_many :student
    has_and_belongs_to_many :tamu_course
end
