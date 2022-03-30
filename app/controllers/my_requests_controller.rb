class MyRequestsController < ApplicationController
    def index
        if student?
            current_student_id = Student.find_by(user_id: current_user.id).id
            @foreign_courses_students = ForeignCoursesStudent.where(student_id: current_student_id)
        else
            redirect_to root_url, alert: "You must be a student to view that page, contact administrator if you believe this an error"
        end
    end 
end
