	class AdminsController < ApplicationController
  before_action :set_admin, only: %i[ show edit update destroy ]

  # GET /admins or /admins.json
  def index
    redirect_to root_path if current_user.role == 1 
    redirect_to syllabi_reviewer_url if current_user.role == 2
    @admins = Admin.all
  end

  # GET /admins/1 or /admins/1.json
  def show
    redirect_to root_path if current_user.role == 1 
    redirect_to syllabi_reviewer_url if current_user.role == 2
  end

  # GET /admins/new
  def new
    redirect_to root_path if current_user.role == 1 
    redirect_to syllabi_reviewer_url if current_user.role == 2
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
    redirect_to root_path if current_user.role == 1 
    redirect_to syllabi_reviewer_url if current_user.role == 2
  end

  # POST /admins or /admins.json
  def create
    redirect_to root_path if current_user.role == 1 
    redirect_to syllabi_reviewer_url if current_user.role == 2
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to admin_url(@admin), notice: "Admin was successfully created." }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1 or /admins/1.json
  def update
    redirect_to root_path if current_user.role == 1 
    redirect_to syllabi_reviewer_url if current_user.role == 2
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to admin_url(@admin), notice: "Admin was successfully updated." }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1 or /admins/1.json
  def destroy
    redirect_to root_path if current_user.role == 1 
    redirect_to syllabi_reviewer_url if current_user.role == 2
    @admin.destroy

    respond_to do |format|
      format.html { redirect_to admins_url, notice: "Admin was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_params
      params.require(:admin).permit(:user_id)
    end
end