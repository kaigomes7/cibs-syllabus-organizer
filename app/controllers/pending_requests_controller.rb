# frozen_string_literal: true

class PendingRequestsController < ApplicationController
  def index
    if reviewer?
      current_reviewer = Reviewer.find_by(user_id: current_user.id)
      @foreign_courses = ForeignCourse.where(tamu_department_id: current_reviewer.tamu_department_id,
                                             course_approval_status: false).order('updated_at')
    else
      redirect_to root_url,
                  alert: 'You must be a reviewer to view that page, contact administrator if you believe this an error'
    end
  end
end
