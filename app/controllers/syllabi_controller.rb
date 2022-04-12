# frozen_string_literal: true

class SyllabiController < ApplicationController
  def student
    @reviewer = Reviewer.where(user_id: current_user.id)
    @student = Student.where(user_id: current_user.id)
    return redirect_to syllabi_user_wait_url if !@reviewer.empty? && current_user.role == 1

    redirect_to syllabi_admin_url if current_user.role.zero?
    redirect_to syllabi_reviewer_path if current_user.role == 2
  end

  def admin
    redirect_to root_path if current_user.role == 1
    redirect_to syllabi_reviewer_url if current_user.role == 2
    @admin = Admin.where(user_id: current_user.id)
  end

  def reviewer
    @reviewer = Reviewer.where(user_id: current_user.id)
    redirect_to root_path if current_user.role == 1
    redirect_to syllabi_admin_url if current_user.role.zero?
  end
end
