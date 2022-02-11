class Student < ApplicationRecord
    belongs_to :tamu_department
    has_and_belongs_to_many :foreign_course
end
