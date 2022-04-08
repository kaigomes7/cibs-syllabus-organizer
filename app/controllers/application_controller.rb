# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def reviewer?
      User.find_by_id(current_user.id).role == 2
  end

  def admin?
      User.find_by_id(current_user.id).role == 0
  end

  def student?
    User.find_by_id(current_user.id).role == 1
  end
end
