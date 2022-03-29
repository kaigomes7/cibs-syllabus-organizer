class ApprovedRequestsReviewersController < ApplicationController
    def index
        if reviewer?
          current_reviewer = Reviewer.find_by(user_id: current_user.id)
          @foreign_courses = ForeignCourse.where(tamu_department_id: current_reviewer.tamu_department_id, course_approval_status: true)
        else
          redirect_to root_url, alert: "You must be a reviewer to view that page, contact administrator if you believe this an error"
        end
    end
end
