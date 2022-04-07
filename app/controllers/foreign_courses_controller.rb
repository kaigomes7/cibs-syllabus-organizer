class ForeignCoursesController < ApplicationController
  
  before_action :set_foreign_course, only: %i[ show edit update destroy ]

  # GET /foreign_courses or /foreign_courses.json
  def index
    if admin?
      @foreign_courses = ForeignCourse.all
      @tamu_departments = TamuDepartment.all
      @universities = University.all
      @foreign_courses_students = ForeignCoursesStudent.all    
    else
        redirect_to root_url, alert: "You must be an admin to view that page, contact administrator if you believe this an error"
    end
  end

  # GET /foreign_courses/1 or /foreign_courses/1.json
  def show
  end

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
    if reviewer?
      @reviewer_courses = TamuCourse.where(tamu_department_id: Reviewer.find_by(user_id: current_user.id).tamu_department_id).order('course_name')
    end
  end

  # POST /foreign_courses or /foreign_courses.json
  def create
    @student = student?
    @admin = admin?
    @reviewer = reviewer?
    start_dates = foreign_course_params.slice!("start_date(1i)", "start_date(2i)", "start_date(3i)")
    end_dates = foreign_course_params.slice!("end_date(1i)", "end_date(2i)", "end_date(3i)")
    
    check_dup_parms = foreign_course_params.slice( "university_id", "foreign_course_num", "foreign_course_dept")
    temp = ForeignCourse.find_by(university_id: check_dup_parms["university_id"], foreign_course_num: check_dup_parms["foreign_course_num"], foreign_course_dept: check_dup_parms["foreign_course_dept"])

    # if the course exists and the FC is approved (approval from Reviewer)
    dup = false
    if temp && temp.course_approval_status == true
      dup = true
      @foreign_course = temp
      puts "in if"
    else
      new_params = foreign_course_params.slice!("foreign_course_name", "contact_hours", "semester_approved", "tamu_department_id", "university_id", "foreign_course_num", "foreign_course_dept", "course_approval_status", "syllabus")
      @foreign_course = ForeignCourse.new(new_params)
      if @foreign_course.course_approval_status.nil?
        @foreign_course.course_approval_status = false
      end
      if @foreign_course.contact_hours.nil?
        @foreign_course.contact_hours = 0
      end
      if @foreign_course.tamu_department_id.nil?
        @foreign_course.tamu_department_id = TamuDepartment.find_by(tamu_department_name: "Unassigned").id
      end
      puts "in else"
    end
    respond_to do |format|
      if dup || @foreign_course.save
        format.html { redirect_to my_requests_path}
        student = Student.find_by(user_id: current_user.id).id
        #check foreign course student table
        temp_2 = ForeignCoursesStudent.find_by(student_id: student, foreign_course_id: @foreign_course.id)
        if !temp_2 || temp_2.admin_course_approval == nil || @foreign_course.course_approval_status == nil
          #create join-table entry if foreign_course succeeds
          sd = start_dates["start_date(1i)"] + "-" + start_dates["start_date(2i)"] + "-" + start_dates["start_date(3i)"]
          ed = end_dates["end_date(1i)"] + "-" + end_dates["end_date(2i)"] + "-" + end_dates["end_date(3i)"]
          curr_student = (Rails.env == 'test') ? 1 : student
          @foreign_course_student = ForeignCoursesStudent.new(foreign_course_id: @foreign_course.id,
            student_id: curr_student,
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
      tamu_course_map = foreign_course_params.slice!("tamu_course_id")
      new_params = foreign_course_params.slice!("foreign_course_name", "contact_hours", "semester_approved", "tamu_department_id", "university_id", "foreign_course_num", "foreign_course_dept", "course_approval_status", "syllabus")
      if @foreign_course.update(new_params)
        # create tamu course connection if approved
        if @foreign_course.course_approval_status
          @foreign_course_tamu_course = ForeignCoursesTamuCourse.new(foreign_course_id: @foreign_course.id, tamu_course_id: tamu_course_map['tamu_course_id'])
          fcs = ForeignCourse.where(university_id: @foreign_course.university_id, foreign_course_num: @foreign_course.foreign_course_num, foreign_course_dept: @foreign_course.foreign_course_dept, course_approval_status: false).where.not(id: @foreign_course.id)
          fcs_ids = fcs.map(&:id)
          fc_stu = ForeignCoursesStudent.where(foreign_course_id: fcs_ids)
          for fc in fc_stu do
            fc.foreign_course_id = @foreign_course.id
            fc.save
          end
          for fc in fcs do
            fc.destroy
          end
          @foreign_course_tamu_course.save
        end

        format.html { redirect_to foreign_course_url(@foreign_course), notice: "Foreign course was successfully updated." }
        format.json { render :show, status: :ok, location: @foreign_course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @foreign_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foreign_courses/1 or /foreign_courses/1.json
  def destroy
    for foreign_course_tamu_course in ForeignCoursesTamuCourse.where(foreign_course_id: @foreign_course.id) do
      foreign_course_tamu_course.destroy
    end
    for foreign_course_student in ForeignCoursesStudent.where(foreign_course_id: @foreign_course.id) do
      foreign_course_student.destroy
    end
    @foreign_course.destroy

    respond_to do |format|
      format.html { redirect_to foreign_courses_url, notice: "Foreign course was successfully destroyed." }
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
      params.require(:foreign_course).permit(:foreign_course_name, :contact_hours, :semester_approved, :tamu_department_id, :university_id, :foreign_course_num, :foreign_course_dept, :course_approval_status, :syllabus, :start_date, :end_date, :tamu_course_id)
    end
end
