# frozen_string_literal: true

json.extract! tamu_department, :id, :tamu_department_name, :created_at, :updated_at
json.url tamu_department_url(tamu_department, format: :json)
