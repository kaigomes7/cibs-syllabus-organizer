class Reviewer < ApplicationRecord
  belongs_to :user
  belongs_to :tamu_department
end
