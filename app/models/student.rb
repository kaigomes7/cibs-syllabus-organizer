class Student < ApplicationRecord
  validates :tamu_major, :tamu_college, :classification, presence: true
  belongs_to :tamu_department
  belongs_to :user
  # has_and_belongs_to_many :foreign_course
end
