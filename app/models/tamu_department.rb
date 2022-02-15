# frozen_string_literal: true

class TamuDepartment < ApplicationRecord
<<<<<<< HEAD
  has_many :tamu_course
  has_many :foreign_course
  has_many :reviewer
  has_many :student
=======
	validates :tamu_department_name, presence: true
    has_many :tamu_course
    has_many :foreign_course
    has_many :reviewer
    has_many :student
>>>>>>> lance-rspec
end
