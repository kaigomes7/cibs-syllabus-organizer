class ForeignCoursesController < ApplicationController
  before_action :set_foreign_course, only: %i[ show edit update destroy ]

  # GET /foreign_courses or /foreign_courses.json
  def index
    @foreign_courses = ForeignCourse.all
    @tamu_departments = TamuDepartment.all
    @universities = University.all
  end

  # GET /foreign_courses/1 or /foreign_courses/1.json
  def show
  end

  # GET /foreign_courses/new
  def new
    @foreign_course = ForeignCourse.new
  end

  # GET /foreign_courses/1/edit
  def edit
  end

  # POST /foreign_courses or /foreign_courses.json
  def create
    @foreign_course = ForeignCourse.new(foreign_course_params)

    respond_to do |format|
      if @foreign_course.save
        format.html { redirect_to foreign_course_url(@foreign_course), notice: "Foreign course was successfully created." }
        format.json { render :show, status: :created, location: @foreign_course }
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
    if @foreign_course.syllabus.attached? # Should always be true since syllabus is validated on create
      @foreign_course.syllabus.purge
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
      params.require(:foreign_course).permit(:foreign_course_name, :contact_hours, :semester_approved, :tamu_department_id, :university_id, :foreign_course_num, :foreign_course_dept, :course_approval_status, :syllabus)
    end
end
