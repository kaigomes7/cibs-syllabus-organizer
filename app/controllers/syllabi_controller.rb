class SyllabiController < ApplicationController
    def student
      redirect_to syllabi_admin_url if current_user.role == 0
      @students = Student.where(user_id: current_user.id)
      @student_found = Student.find_by_id(current_user.id)
    end
  
    def admin
      redirect_to root_path if current_user.role == 1
      
    end
  end
