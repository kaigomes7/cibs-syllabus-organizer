# frozen_string_literal: true

class MyRequestsController < ApplicationController
  def index
    if student?
      @current_student_id = Student.find_by(user_id: current_user.id).id
      fcs = ForeignCoursesStudent.where(student_id: @current_student_id)
      @foreign_courses_students = fcs.map {|x| [x, ForeignCourse.find_by_id(x.foreign_course_id)]}.compact
    else
      redirect_to root_url,
                  alert: 'You must be a student to view that page, contact administrator if you believe this an error'
    end
  end
end
