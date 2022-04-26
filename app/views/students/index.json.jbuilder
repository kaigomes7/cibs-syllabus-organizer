# frozen_string_literal: true

json.array! @students, partial: 'students/student', as: :student
