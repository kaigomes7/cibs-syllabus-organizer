# frozen_string_literal: true

module ApplicationHelper
  def error_messages_for(object)
    render(partial: 'application/error_messages', locals: { object: object })
  end

  def flash_class(level)
    flash_map = { notice: 'alert alert-info',
                  success: 'alert alert-success',
                  alert: 'alert alert-error' }
    flash_map[level]
  end
end
