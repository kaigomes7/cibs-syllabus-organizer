# frozen_string_literal: true

class SyllabiController < ApplicationController
  def student
    redirect_to syllabi_admin_url if current_user.role.zero?
    redirect_to syllabi_reviewer_path if current_user.role == 2
    @student = Student.where(user_id: current_user.id)
  end

  def admin
    redirect_to root_path if current_user.role == 1
    redirect_to syllabi_reviewer_url if current_user.role == 2
    @admin = Admin.where(user_id: current_user.id)
  end

  def reviewer
    redirect_to root_path if current_user.role == 1
    redirect_to syllabi_admin_url if current_user.role.zero?
    @reviewer = Reviewer.where(user_id: current_user.id)
  end
end
