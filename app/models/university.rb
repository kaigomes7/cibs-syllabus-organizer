# frozen_string_literal: true

class University < ApplicationRecord
<<<<<<< HEAD
  has_many :foreign_course
=======
    validates :country, :university_name, presence: true
	has_many :foreign_course
>>>>>>> lance-rspec
end
