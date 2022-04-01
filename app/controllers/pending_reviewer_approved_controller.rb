class PendingReviewerApprovedController < ApplicationController
    def index
        @foreign_courses = ForeignCourse.where(course_approval_status: true)
        @foreign_courses_students = ForeignCoursesStudent.all
    end   
end
