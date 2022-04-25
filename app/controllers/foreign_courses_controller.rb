# frozen_string_literal: true

class ForeignCoursesController < ApplicationController
  before_action :set_foreign_course, only: %i[show edit update destroy]

  # GET /foreign_courses or /foreign_courses.json
  def index
    if admin? || current_user.role.zero?
      @foreign_courses = ForeignCourse.all
      @tamu_departments = TamuDepartment.all
      @universities = University.all
      @foreign_courses_students = ForeignCoursesStudent.all
    else
      redirect_to root_url, alert: 'You must be an admin to view that page, contact administrator if you believe this an error'
    end
  end

  # GET /foreign_courses/1 or /foreign_courses/1.json
  def show; end

  # GET /foreign_courses/new
  def new
    @student = student?
    @admin = admin?
    @reviewer = reviewer?
    @foreign_course = ForeignCourse.new
  end

  # GET /foreign_courses/1/edit
  def edit
    @student = student?
    @admin = admin?
    @reviewer = reviewer?
    @reviewer_courses = TamuCourse.where(tamu_department_id: Reviewer.find_by(user_id: current_user.id).tamu_department_id).order('course_name') if reviewer?
  end

  # POST /foreign_courses or /foreign_courses.json
  def create
    @student = student?
    @admin = admin?
    @reviewer = reviewer?
    curr_student_id = Student.find_by(user_id: current_user.id).id
    start_dates = foreign_course_params.slice!('start_date(1i)', 'start_date(2i)', 'start_date(3i)')
    end_dates = foreign_course_params.slice!('end_date(1i)', 'end_date(2i)', 'end_date(3i)')

    check_dup_parms = foreign_course_params.slice('university_id', 'foreign_course_num', 'foreign_course_dept')
    temp = ForeignCourse.find_by(university_id: check_dup_parms['university_id'],
                                 foreign_course_num: check_dup_parms['foreign_course_num'],
                                 foreign_course_dept: check_dup_parms['foreign_course_dept'])

    dup = false
    exists_for_student = nil
    # first condition checks if a course request already exists for any student
    # second condition checks that if the course has already been approved or the same student submitting has an outstanding (not rejected) request for the course
    if temp
      exists_for_student = ForeignCoursesStudent.find_by(foreign_course_id: temp.id, student_id: curr_student_id)
      if temp.course_approval_status == true || (exists_for_student && !temp.course_approval_status.nil?)
        dup = true
        @foreign_course = temp
      end
    end

    unless dup
      new_params = foreign_course_params.slice!('foreign_course_name', 'contact_hours', 'semester_approved',
                                                'tamu_department_id', 'university_id', 'foreign_course_num',
                                                'foreign_course_dept', 'course_approval_status', 'syllabus', 'comments')
      new_params[:semester_approved] = "#{foreign_course_params[:sem]} #{foreign_course_params[:year]}" unless foreign_course_params[:year].empty?
      @foreign_course = ForeignCourse.new(new_params)
      @foreign_course.course_approval_status = false if @foreign_course.course_approval_status.nil?
      @foreign_course.contact_hours = 0 if @foreign_course.contact_hours.nil?
      @foreign_course.tamu_department_id = TamuDepartment.find_by(tamu_department_name: 'Unassigned').id if @foreign_course.tamu_department_id.nil?
    end
    respond_to do |format|
      if dup || @foreign_course.save
        if dup && exists_for_student && !exists_for_student.admin_course_approval.nil?
          format.html { redirect_to my_requests_path, alert: 'You have an outstanding/approved request for this course' }
        else
          format.html { redirect_to my_requests_path }
        end
        # check foreign course student table
        if !exists_for_student || exists_for_student.admin_course_approval.nil? || temp.course_approval_status.nil?
          # create join-table entry if foreign_course succeeds
          sd = "#{start_dates['start_date(1i)']}-#{start_dates['start_date(2i)']}-#{start_dates['start_date(3i)']}"
          ed = "#{end_dates['end_date(1i)']}-#{end_dates['end_date(2i)']}-#{end_dates['end_date(3i)']}"

          @foreign_course_student = ForeignCoursesStudent.new(foreign_course_id: @foreign_course.id,
                                                              student_id: curr_student_id,
                                                              start_date: Date.parse(sd, '%Y-%m-%d'),
                                                              end_date: Date.parse(ed, '%Y-%m-%d'), admin_course_approval: false)
          @foreign_course_student.save
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @foreign_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foreign_courses/1 or /foreign_courses/1.json
  def update
    respond_to do |format|
      tamu_course_map = foreign_course_params.slice!('tamu_course_id')
      new_params = foreign_course_params.slice!('foreign_course_name', 'contact_hours', 'semester_approved',
                                                'tamu_department_id', 'university_id', 'foreign_course_num',
                                                'foreign_course_dept', 'course_approval_status', 'syllabus', 'comments')
      if @foreign_course.update(new_params)
        # create tamu course connection if approved
        if @foreign_course.course_approval_status
          @foreign_course_tamu_course = ForeignCoursesTamuCourse.new(foreign_course_id: @foreign_course.id,
                                                                     tamu_course_id: tamu_course_map['tamu_course_id'])
          fcs = ForeignCourse.where(university_id: @foreign_course.university_id,
                                    foreign_course_num: @foreign_course.foreign_course_num, foreign_course_dept: @foreign_course.foreign_course_dept, course_approval_status: false).where.not(id: @foreign_course.id)
          fcs_ids = fcs.map(&:id)
          fc_stu = ForeignCoursesStudent.where(foreign_course_id: fcs_ids)
          fc_stu.each do |fc|
            fc.foreign_course_id = @foreign_course.id
            fc.save
          end
          fcs.each(&:destroy)
          @foreign_course_tamu_course.save
        end

        format.html do
          if reviewer?
            redirect_to pending_requests_path, notice: 'Request status updated successfully.'
          elsif admin?
            redirect_to assign_reviewer_path, notice: 'Request successfully assigned.'
          elsif student?
            redirect_to my_requests_path, notice: 'Request was successfully updated.'
          else # Should never happen since user should always have role that is reviewer, admin, or student
            redirect_to root_path, notice: 'No role associated with current user, please contact administrator'
          end
        end
        format.json { render :show, status: :ok, location: @foreign_course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @foreign_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foreign_courses/1 or /foreign_courses/1.json
  def destroy
    ForeignCoursesTamuCourse.where(foreign_course_id: @foreign_course.id).each(&:destroy)
    ForeignCoursesStudent.where(foreign_course_id: @foreign_course.id).each(&:destroy)
    @foreign_course.destroy

    respond_to do |format|
      format.html { redirect_to foreign_courses_url, notice: 'Foreign course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_foreign_course
    @foreign_course = ForeignCourse.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def foreign_course_params
    params.require(:foreign_course).permit(:foreign_course_name, :contact_hours, :semester_approved,
                                           :tamu_department_id, :university_id, :foreign_course_num,
                                           :foreign_course_dept, :course_approval_status, :syllabus,
                                           :start_date, :end_date, :tamu_course_id, :sem, :year, :comments)
  end
end
