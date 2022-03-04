class AssignReviewerController < ApplicationController
    def index
        @foreign_courses = ForeignCourse.all
        @tamu_departments = TamuDepartment.all
        @universities = University.all
        @reviewers = Reviewer.all
        @tamu_courses = TamuCourse.all
        @students = Student.all
    end   
end
