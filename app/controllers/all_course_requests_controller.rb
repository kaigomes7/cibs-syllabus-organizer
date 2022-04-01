class AllCourseRequestsController < ApplicationController
    def index
        if admin?
            @foreign_courses = ForeignCourse.all
        else
           redirect_to root_url, alert: "You must be an admin to view that page, contact administrator if you believe this an error"
        end
    end   
end
