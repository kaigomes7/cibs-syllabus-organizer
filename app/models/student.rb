# frozen_string_literal: true

class Student < ApplicationRecord
<<<<<<< HEAD
=======
  validates :student_email, :student_name, :tamu_department_id, presence: true
>>>>>>> lance-rspec
  belongs_to :tamu_department
  has_and_belongs_to_many :foreign_course
end
