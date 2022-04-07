# frozen_string_literal: true

class UserController < ApplicationController
  def index
    redirect_to root_path if current_user.role == 1
    redirect_to syllabi_reviewer_url if current_user.role == 2
    @users = User.all
  end

  def update
    redirect_to root_path if current_user.role == 1
    redirect_to syllabi_reviewer_url if current_user.role == 2
    @user = User.find(params[:id])
    if @user.update(user_params)
        redirect_to action: "index"
        @student = Student.find_by_user_id(@user.id)
        if @student != nil
            @student.destroy
        end
        @reviewer = Reviewer.find_by_user_id(@user.id)
        if @reviewer != nil
            @reviewer.destroy
        end
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  def edit
    redirect_to root_path if current_user.role == 1
    redirect_to syllabi_reviewer_url if current_user.role == 2
    @user = User.find(params[:id])
  end

  def show
    redirect_to root_path if current_user.role == 1
    redirect_to syllabi_reviewer_url if current_user.role == 2
    @user = User.find_by(id: params[:id])

    return unless @user.nil?

    flash[:error] = 'You are not an admin'
    redirect_to root_path
  end

  def delete
    redirect_to root_path if current_user.role == 1
    redirect_to syllabi_reviewer_url if current_user.role == 2
    @user = User.find(params[:id])
  end

  def destroy
    redirect_to root_path if current_user.role == 1
    redirect_to syllabi_reviewer_url if current_user.role == 2
    @user = User.find(params[:id])
    @user.destroy
    redirect_to action: 'index'
  end

  def user_params
    params.require(:user).permit(:name, :email, :role)
  end
end
