# frozen_string_literal: true

json.array! @admins, partial: 'admins/admin', as: :admin
