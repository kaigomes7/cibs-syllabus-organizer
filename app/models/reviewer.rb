class Reviewer < ApplicationRecord
  belongs_to :tamu_department
  belongs_to :user
end
