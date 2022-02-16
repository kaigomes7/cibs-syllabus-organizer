# frozen_string_literal: true

class TamuCourse < ApplicationRecord
  validates :course_num, :tamu_department_id, presence: true
  belongs_to :tamu_department
  has_and_belongs_to_many :foreign_course

  def formatted_course
    "#{TamuDepartment.find(tamu_department_id).tamu_department_name} #{course_num}"
  end
end
