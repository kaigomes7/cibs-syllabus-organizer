class PendingReviewerApprovedController < ApplicationController
    def index
        if admin?
            # foreign courses whose admin approval status is false but whose course approval status is true
            fc_ids = ForeignCourse.where(course_approval_status: true).map(&:id)
            @foreign_courses_students = ForeignCoursesStudent.where(admin_course_approval: false, foreign_course_id: fc_ids)
        else
           redirect_to root_url, alert: "You must be an admin to view that page, contact administrator if you believe this an error"
        end
    end   
end
