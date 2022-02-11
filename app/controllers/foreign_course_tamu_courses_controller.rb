class ForeignCourseTamuCoursesController < ApplicationController
  before_action :set_foreign_course_tamu_course, only: %i[ show edit update destroy ]

  # GET /foreign_course_tamu_courses or /foreign_course_tamu_courses.json
  def index
    @foreign_course_tamu_courses = ForeignCourseTamuCourse.all
  end

  # GET /foreign_course_tamu_courses/1 or /foreign_course_tamu_courses/1.json
  def show
  end

  # GET /foreign_course_tamu_courses/new
  def new
    @foreign_course_tamu_course = ForeignCourseTamuCourse.new
  end

  # GET /foreign_course_tamu_courses/1/edit
  def edit
  end

  # POST /foreign_course_tamu_courses or /foreign_course_tamu_courses.json
  def create
    @foreign_course_tamu_course = ForeignCourseTamuCourse.new(foreign_course_tamu_course_params)

    respond_to do |format|
      if @foreign_course_tamu_course.save
        format.html { redirect_to foreign_course_tamu_course_url(@foreign_course_tamu_course), notice: "Foreign course tamu course was successfully created." }
        format.json { render :show, status: :created, location: @foreign_course_tamu_course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @foreign_course_tamu_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foreign_course_tamu_courses/1 or /foreign_course_tamu_courses/1.json
  def update
    respond_to do |format|
      if @foreign_course_tamu_course.update(foreign_course_tamu_course_params)
        format.html { redirect_to foreign_course_tamu_course_url(@foreign_course_tamu_course), notice: "Foreign course tamu course was successfully updated." }
        format.json { render :show, status: :ok, location: @foreign_course_tamu_course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @foreign_course_tamu_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foreign_course_tamu_courses/1 or /foreign_course_tamu_courses/1.json
  def destroy
    @foreign_course_tamu_course.destroy

    respond_to do |format|
      format.html { redirect_to foreign_course_tamu_courses_url, notice: "Foreign course tamu course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foreign_course_tamu_course
      @foreign_course_tamu_course = ForeignCourseTamuCourse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def foreign_course_tamu_course_params
      params.require(:foreign_course_tamu_course).permit(:foreign_course_id, :tamu_course_id)
    end
end
