# frozen_string_literal: true

class TamuDepartment < ApplicationRecord
  has_many :tamu_course
  has_many :foreign_course
  has_many :reviewer
  has_many :student
end
