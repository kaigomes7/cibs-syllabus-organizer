class Student < ApplicationRecord
  validates :tamu_major, :tamu_college, :classification, presence: true
  belongs_to :tamu_department
  belongs_to :user
  # has_and_belongs_to_many :foreign_course
  def student_name
    "#{User.find(user_id).name}"
  end
end
