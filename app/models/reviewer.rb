# frozen_string_literal: true

class Reviewer < ApplicationRecord
  validates :tamu_department_id, :user_id, presence: true
  belongs_to :tamu_department
  belongs_to :user
end
