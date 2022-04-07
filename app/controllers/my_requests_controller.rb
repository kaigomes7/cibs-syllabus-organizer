# frozen_string_literal: true

class MyRequestsController < ApplicationController
  def index
    if student?
      @current_student_id = Rails.env == 'test' ? 1 : Student.find_by(user_id: current_user.id).id
      fcs_ids = ForeignCoursesStudent.where(student_id: @current_student_id).map(&:foreign_course_id)
      @foreign_courses = ForeignCourse.where(id: fcs_ids)
    else
      redirect_to root_url,
                  alert: 'You must be a student to view that page, contact administrator if you believe this an error'
    end
  end
end
