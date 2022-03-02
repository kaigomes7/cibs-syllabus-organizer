class Admin < ApplicationRecord
  validates :name, :email, presence: true
end
