class ForeignCourse < ApplicationRecord
  belongs_to :tamu_department
  belongs_to :university
end
