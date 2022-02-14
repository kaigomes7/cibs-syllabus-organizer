class TamuCoursesController < ApplicationController
  before_action :set_tamu_course, only: %i[ show edit update destroy ]

  # GET /tamu_courses or /tamu_courses.json
  def index
    @tamu_courses = TamuCourse.all
	@tamu_departments = TamuDepartment.all
  end

  # GET /tamu_courses/1 or /tamu_courses/1.json
  def show
  end

  # GET /tamu_courses/new
  def new
    @tamu_course = TamuCourse.new
  end

  # GET /tamu_courses/1/edit
  def edit
  end

  # POST /tamu_courses or /tamu_courses.json
  def create
    @tamu_course = TamuCourse.new(tamu_course_params)

    respond_to do |format|
      if @tamu_course.save
        format.html { redirect_to tamu_course_url(@tamu_course), notice: "Tamu course was successfully created." }
        format.json { render :show, status: :created, location: @tamu_course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tamu_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tamu_courses/1 or /tamu_courses/1.json
  def update
    respond_to do |format|
      if @tamu_course.update(tamu_course_params)
        format.html { redirect_to tamu_course_url(@tamu_course), notice: "Tamu course was successfully updated." }
        format.json { render :show, status: :ok, location: @tamu_course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tamu_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tamu_courses/1 or /tamu_courses/1.json
  def destroy
    @tamu_course.destroy

    respond_to do |format|
      format.html { redirect_to tamu_courses_url, notice: "Tamu course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tamu_course
      @tamu_course = TamuCourse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tamu_course_params
      params.require(:tamu_course).permit(:course_num, :tamu_department_id)
    end
end
