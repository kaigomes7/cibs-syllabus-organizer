# frozen_string_literal: true

class AssignReviewerController < ForeignCoursesController
  def index
    if admin?
      @foreign_courses = ForeignCourse.where(course_approval_status: false)
    else
      redirect_to root_url,
                  alert: 'You must be an admin to view that page, contact administrator if you believe this an error'
    end
  end
end
