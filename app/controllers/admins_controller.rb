class AdminsController < ApplicationController
  before_action :set_admin, only: %i[ show edit update destroy ]

  # GET /admins or /admins.json
  def index
    redirect_to root_path if current_user.role == 1 or current_user.role == 2
    @admins = Admin.all
    @users = User.all
  end

  # GET /admins/1 or /admins/1.json
  def show
    redirect_to root_path if current_user.role == 1 or current_user.role == 2
  end

  # GET /admins/1/edit
  def edit
    redirect_to root_path if current_user.role == 1 or current_user.role == 2
    @user = User.find_by(id: params[:id])
  end

  def delete
    redirect_to root_path if current_user.role == 1 or current_user.role == 2
    @user = User.find_by(id: params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      redirect_to root_path if current_user.role == 1 or current_user.role == 2
      @user = User.find_by_id(current_user.id)
    end

    # Only allow a list of trusted parameters through.
    def admin_params
      params.require(:admin).permit(:user_id)
    end
end
