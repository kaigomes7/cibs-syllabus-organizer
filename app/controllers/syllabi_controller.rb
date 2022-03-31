class SyllabiController < ApplicationController
    def student
      # redirect_to syllabi_admin_url if current_user.role == 0
      # redirect_to syllabi_reviewer_url if current_user.role == 2
      # @students = Student.where(user_id: current_user.id)
      # @student_found = Student.find_by_id(current_user.id)
      if current_user.role == 0 
        redirect_to syllabi_admin_url
      elsif current_user.role == 2
        redirect_to syllabi_reviewer_url
      else #student
        @students = Student.where(user_id: current_user.id)
        @student_found = Student.find_by_id(@students[0])
      end
    end
  
    # def admin
    #   redirect_to root_path if current_user.role == 1
    #   redirect_to syllabi_reviewer_url if current_user.role == 2
    #   @admins = Admin.where(user_id: current_user.id)
    #   @admin_found = Admin.find_by_id(current_user.id)
    # end

    # def reviewer
    #   redirect_to root_path if current_user.role == 1
    #   redirect_to syllabi_admin_url if current_user.role == 0
    #   @reviewers = Reviewer.where(user_id: current_user.id)
    #   @reviewer_found = Reviewer.find_by_id(current_user.id)
    # end

    # def syllabi
    #   if current_user.role == 0 #admin
    #     @admins = Admin.where(user_id: current_user.id)
    #     @admin_found = Admin.find_by_id(current_user.id)
    #     redirect_to syllabi_admin_url
    #   elsif current_user.role == 2 #reviewer
    #     @reviewers = Reviewer.where(user_id: current_user.id)
    #     @reviewer_found = Reviewer.find_by_id(current_user.id)
    #     redirect_to syllabi_reviewer_url
    #   else #student
    #     @students = Student.where(user_id: current_user.id)
    #     @student_found = Student.find_by_id(current_user.id)
    #     redirect_to root_path
    #   end
    # end
end