class SyllabiController < ApplicationController
    def student
      redirect_to syllabi_admin_url if current_user.role == 0
      redirect_to syllabi_reviewer_path if current_user.role == 2
      @student = Student.where(user_id: current_user.id)
    end
  
    def admin
      redirect_to root_path if current_user.role == 1
      redirect_to syllabi_reviewer_url if current_user.role == 2
      
    end

    def reviewer
      redirect_to root_path if current_user.role == 1
      redirect_to syllabi_admin_url if current_user.role == 0
      @reviewer = Reviewer.where(user_id: current_user.id)
    end
  end
