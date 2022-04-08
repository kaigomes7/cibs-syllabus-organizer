# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user! if Rails.env != 'test'

  def reviewer?
    if Rails.env == 'test'
      ENV['TEST_USER'] == 'reviewer'
    else
      User.find_by_id(current_user.id).role == 2
    end
  end

  def admin?
    if Rails.env == 'test'
      ENV['TEST_USER'] == 'admin'
    else
      User.find_by_id(current_user.id).role == 0
    end
  end

  def student?
    if Rails.env == 'test'
      ENV['TEST_USER'] == 'student'
    else
      User.find_by_id(current_user.id).role == 1
    end
  end
end
