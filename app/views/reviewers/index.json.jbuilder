# frozen_string_literal: true

json.array! @reviewers, partial: 'reviewers/reviewer', as: :reviewer
