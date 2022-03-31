class PendingReviewerApprovedController < ApplicationController
    def index
        @foreign_courses = ForeignCourse.where(course_approval_status: true)
    end   
end
