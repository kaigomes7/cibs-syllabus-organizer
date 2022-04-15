# frozen_string_literal: true

class Student < ApplicationRecord
  validates :tamu_major, :tamu_college, :classification, presence: true
  belongs_to :tamu_department
  belongs_to :user
  has_many :foreign_courses_students, dependent: :destroy
  # has_and_belongs_to_many :foreign_course
  def student_name
    User.find(user_id).name.to_s
  end
end
