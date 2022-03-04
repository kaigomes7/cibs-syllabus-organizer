class AllCourseRequestsController < ApplicationController
    def index
        @foreign_courses = ForeignCourse.all
        @tamu_departments = TamuDepartment.all
        @universities = University.all
    end   
end
