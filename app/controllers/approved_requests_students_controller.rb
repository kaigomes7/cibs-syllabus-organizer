class ApprovedRequestsStudentsController < ApplicationController
    def index
        if student?
            current_student_id = Student.find_by(user_id: current_user.id).id
            fcs_ids = ForeignCoursesStudent.where(student_id: current_student_id, admin_course_approval: true).map(&:foreign_course_id)
            fc_ids = ForeignCourse.where(course_approval_status: true).map(&:id)
            @foreign_courses = ForeignCourse.where(id: fcs_ids & fc_ids)
        else
            redirect_to root_url, alert: "You must be a student to view that page, contact administrator if you believe this an error"
        end
    end
end
