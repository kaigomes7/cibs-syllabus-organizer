class TamuDepartmentsController < ApplicationController
  before_action :set_tamu_department, only: %i[ show edit update destroy ]

  # GET /tamu_departments or /tamu_departments.json
  def index
    if admin?
      @tamu_departments = TamuDepartment.all   
    else
      redirect_to root_url, alert: "You must be an admin to view that page, contact administrator if you believe this an error"
    end
    
  end

  # GET /tamu_departments/1 or /tamu_departments/1.json
  def show
  end

  # GET /tamu_departments/new
  def new
    @tamu_department = TamuDepartment.new
  end

  # GET /tamu_departments/1/edit
  def edit
  end

  # POST /tamu_departments or /tamu_departments.json
  def create
    @tamu_department = TamuDepartment.new(tamu_department_params)

    respond_to do |format|
      if @tamu_department.save
        format.html { redirect_to tamu_department_url(@tamu_department), notice: "Tamu department was successfully created." }
        format.json { render :show, status: :created, location: @tamu_department }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tamu_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tamu_departments/1 or /tamu_departments/1.json
  def update
    respond_to do |format|
      if @tamu_department.update(tamu_department_params)
        format.html { redirect_to tamu_department_url(@tamu_department), notice: "Tamu department was successfully updated." }
        format.json { render :show, status: :ok, location: @tamu_department }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tamu_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tamu_departments/1 or /tamu_departments/1.json
  def destroy
    @tamu_department.destroy

    respond_to do |format|
      format.html { redirect_to tamu_departments_url, notice: "Tamu department was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tamu_department
      @tamu_department = TamuDepartment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tamu_department_params
      params.require(:tamu_department).permit(:tamu_department_name)
    end
end
