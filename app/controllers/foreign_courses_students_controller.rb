# frozen_string_literal: true

class ForeignCoursesStudentsController < ApplicationController
  before_action :set_foreign_courses_student, only: %i[show edit update destroy]

  # GET /foreign_courses_students or /foreign_courses_students.json
  def index
    @foreign_courses_students = ForeignCoursesStudent.all
  end

  # GET /foreign_courses_students/1 or /foreign_courses_students/1.json
  def show; end

  # GET /foreign_courses_students/new
  def new
    @foreign_courses_student = ForeignCoursesStudent.new
  end

  # GET /foreign_courses_students/1/edit
  def edit; end

  # POST /foreign_courses_students or /foreign_courses_students.json
  def create
    @foreign_courses_student = ForeignCoursesStudent.new(foreign_courses_student_params)

    respond_to do |format|
      if @foreign_courses_student.save
        format.html do
          redirect_to pending_reviewer_approved_path,
                      notice: 'Foreign courses student was successfully created.'
        end
        format.json { render :show, status: :created, location: @foreign_courses_student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @foreign_courses_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foreign_courses_students/1 or /foreign_courses_students/1.json
  def update
    respond_to do |format|
      if @foreign_courses_student.update(foreign_courses_student_params)
        format.html do
          redirect_to pending_reviewer_approved_path,
                      notice: 'Foreign courses student was successfully updated.'
        end
        # format.json { render :show, status: :ok, location: @foreign_courses_student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @foreign_courses_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foreign_courses_students/1 or /foreign_courses_students/1.json
  def destroy
    @foreign_courses_student.destroy

    respond_to do |format|
      format.html do
        redirect_to foreign_courses_students_url, notice: 'Foreign courses student was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_foreign_courses_student
    @foreign_courses_student = ForeignCoursesStudent.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def foreign_courses_student_params
    params.require(:foreign_courses_student).permit(:student_id, :foreign_course_id, :admin_course_approval,
                                                    :start_date, :end_date)
  end
end
