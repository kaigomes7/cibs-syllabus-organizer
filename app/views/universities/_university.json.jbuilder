# frozen_string_literal: true

json.extract! university, :id, :country, :university_name, :created_at, :updated_at
json.url university_url(university, format: :json)
