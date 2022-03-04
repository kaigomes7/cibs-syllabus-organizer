class Student < ApplicationRecord
  belongs_to :user
  belongs_to :tamu_department
end
