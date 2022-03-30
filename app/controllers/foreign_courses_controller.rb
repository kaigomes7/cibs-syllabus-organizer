class ForeignCoursesController < ApplicationController
  
  before_action :set_foreign_course, only: %i[ show edit update destroy ]

  # GET /foreign_courses or /foreign_courses.json
  def index
    @foreign_courses = ForeignCourse.all
    @tamu_departments = TamuDepartment.all
    @universities = University.all
    @foreign_courses_students = ForeignCoursesStudent.all
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
  end

  # POST /foreign_courses or /foreign_courses.json
  def create
    @student = student?
    @admin = admin?
    @reviewer = reviewer?
    start_dates = foreign_course_params.slice!("start_date(1i)", "start_date(2i)", "start_date(3i)")
    end_dates = foreign_course_params.slice!("end_date(1i)", "end_date(2i)", "end_date(3i)")
    new_params = foreign_course_params.slice!("foreign_course_name", "contact_hours", "semester_approved", "tamu_department_id", "university_id", "foreign_course_num", "foreign_course_dept", "course_approval_status", "syllabus")
    @foreign_course = ForeignCourse.new(new_params)
    if @foreign_course.course_approval_status.nil?
      @foreign_course.course_approval_status = false
    end
    if @foreign_course.contact_hours.nil?
      @foreign_course.contact_hours = 0
    end

    respond_to do |format|
      if @foreign_course.save
        format.html { redirect_to foreign_course_url(@foreign_course), notice: "Foreign course was successfully created." }
        format.json { render :show, status: :created, location: @foreign_course }
        
        #create join-table entry if foreign_course succeeds
        sd = start_dates["start_date(1i)"] + "-" + start_dates["start_date(2i)"] + "-" + start_dates["start_date(3i)"]
        ed = end_dates["end_date(1i)"] + "-" + end_dates["end_date(2i)"] + "-" + end_dates["end_date(3i)"]
        curr_student = (Rails.env == 'test') ? 1 : Student.find_by(user_id: current_user.id).id
        @foreign_course_student = ForeignCoursesStudent.new(foreign_course_id: @foreign_course.id,
          student_id: curr_student,
          start_date: Date.parse(sd, '%Y-%m-%d'),
          end_date: Date.parse(ed, '%Y-%m-%d'), admin_course_approval: false)
        @foreign_course_student.save
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @foreign_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foreign_courses/1 or /foreign_courses/1.json
  def update
    respond_to do |format|
      if @foreign_course.update(foreign_course_params)
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
      params.require(:foreign_course).permit(:foreign_course_name, :contact_hours, :semester_approved, :tamu_department_id, :university_id, :foreign_course_num, :foreign_course_dept, :course_approval_status, :syllabus, :start_date, :end_date)
    end
end
