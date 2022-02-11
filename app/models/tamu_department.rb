class TamuDepartment < ApplicationRecord
    has_many :foreign_courses
    has_many :students
end
