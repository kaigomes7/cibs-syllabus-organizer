# frozen_string_literal: true

class CoursesStudentsController < ApplicationController
  before_action :set_courses_student, only: %i[show edit update destroy]

  # GET /courses_students or /courses_students.json
  def index
    @courses_students = CoursesStudent.all
	@students = Student.all
	@foreign_courses = ForeignCourse.all
  end

  # GET /courses_students/1 or /courses_students/1.json
  def show; end

  # GET /courses_students/new
  def new
    @courses_student = CoursesStudent.new
  end

  # GET /courses_students/1/edit
  def edit; end

  # POST /courses_students or /courses_students.json
  def create
    @courses_student = CoursesStudent.new(courses_student_params)

    respond_to do |format|
      if @courses_student.save
        format.html do
          redirect_to courses_student_url(@courses_student), notice: 'Courses student was successfully created.'
        end
        format.json { render :show, status: :created, location: @courses_student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @courses_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses_students/1 or /courses_students/1.json
  def update
    respond_to do |format|
      if @courses_student.update(courses_student_params)
        format.html do
          redirect_to courses_student_url(@courses_student), notice: 'Courses student was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @courses_student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @courses_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses_students/1 or /courses_students/1.json
  def destroy
    @courses_student.destroy

    respond_to do |format|
      format.html { redirect_to courses_students_url, notice: 'Courses student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_courses_student
    @courses_student = CoursesStudent.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def courses_student_params
    params.require(:courses_student).permit(:student_id, :foreign_course_id)
  end
end
