class ForeignCoursesTamuCoursesController < ApplicationController
  before_action :set_foreign_courses_tamu_course, only: %i[ show edit update destroy ]

  # GET /foreign_courses_tamu_courses or /foreign_courses_tamu_courses.json
  def index
    @foreign_courses_tamu_courses = ForeignCoursesTamuCourse.all
  end

  # GET /foreign_courses_tamu_courses/1 or /foreign_courses_tamu_courses/1.json
  def show
  end

  # GET /foreign_courses_tamu_courses/new
  def new
    @foreign_courses_tamu_course = ForeignCoursesTamuCourse.new
  end

  # GET /foreign_courses_tamu_courses/1/edit
  def edit
  end

  # POST /foreign_courses_tamu_courses or /foreign_courses_tamu_courses.json
  def create
    @foreign_courses_tamu_course = ForeignCoursesTamuCourse.new(foreign_courses_tamu_course_params)

    respond_to do |format|
      if @foreign_courses_tamu_course.save
        format.html { redirect_to foreign_courses_tamu_course_url(@foreign_courses_tamu_course), notice: "Foreign courses tamu course was successfully created." }
        format.json { render :show, status: :created, location: @foreign_courses_tamu_course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @foreign_courses_tamu_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foreign_courses_tamu_courses/1 or /foreign_courses_tamu_courses/1.json
  def update
    respond_to do |format|
      if @foreign_courses_tamu_course.update(foreign_courses_tamu_course_params)
        format.html { redirect_to foreign_courses_tamu_course_url(@foreign_courses_tamu_course), notice: "Foreign courses tamu course was successfully updated." }
        format.json { render :show, status: :ok, location: @foreign_courses_tamu_course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @foreign_courses_tamu_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foreign_courses_tamu_courses/1 or /foreign_courses_tamu_courses/1.json
  def destroy
    @foreign_courses_tamu_course.destroy

    respond_to do |format|
      format.html { redirect_to foreign_courses_tamu_courses_url, notice: "Foreign courses tamu course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foreign_courses_tamu_course
      @foreign_courses_tamu_course = ForeignCoursesTamuCourse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def foreign_courses_tamu_course_params
      params.require(:foreign_courses_tamu_course).permit(:foreign_course_id, :tamu_course)
    end
end
