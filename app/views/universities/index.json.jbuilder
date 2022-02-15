# frozen_string_literal: true

json.array! @universities, partial: 'universities/university', as: :university
