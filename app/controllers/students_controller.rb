# frozen_string_literal: true

class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update destroy]

  # GET /students or /students.json
  def index
    redirect_to root_path if current_user.role == 1
    redirect_to syllabi_reviewer_url if current_user.role == 2
    @students = Student.all
    @tamu_departments = TamuDepartment.all
  end

  # GET /students/1 or /students/1.json
  def show
    redirect_to syllabi_admin_url if current_user.role.zero?
    redirect_to syllabi_reviewer_url if current_user.role == 2
  end

  # GET /students/new
  def new
    redirect_to syllabi_admin_url if current_user.role.zero?
    redirect_to syllabi_reviewer_url if current_user.role == 2
    @students = Student.where(user_id: current_user.id)
    if @students.empty?
      @student = Student.new
    else
      redirect_to root_path
    end
  end

  # GET /students/1/edit
  def edit
    redirect_to syllabi_admin_url if current_user.role.zero?
    redirect_to syllabi_reviewer_url if current_user.role == 2
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to root_path, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to root_path, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    ForeignCoursesStudent.where(student_id: @student.id).each(&:destroy)
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # def get_student
  #   @students = Student.find(params[:user_id])
  # end
  # Only allow a list of trusted parameters through.
  def student_params
    params.require(:student).permit(:tamu_department_id, :user_id, :tamu_major, :tamu_college, :classification)
  end
end
