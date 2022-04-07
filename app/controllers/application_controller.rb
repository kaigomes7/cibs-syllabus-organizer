# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user! if Rails.env != 'test'

  def reviewer?
    if Rails.env == 'test'
      ENV['TEST_USER'] == 'reviewer'
    else
      Reviewer.exists?(user_id: current_user.id)
    end
  end

  def admin?
    if Rails.env == 'test'
      ENV['TEST_USER'] == 'admin'
    else
      Admin.exists?(user_id: current_user.id)
    end
  end

  def student?
    if Rails.env == 'test'
      ENV['TEST_USER'] == 'student'
    else
      Student.exists?(user_id: current_user.id)
    end
  end
end
