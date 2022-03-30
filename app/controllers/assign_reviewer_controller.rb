class AssignReviewerController < ApplicationController
    def index
        @foreign_courses = ForeignCourse.where(course_approval_status: false)
    end   
end
