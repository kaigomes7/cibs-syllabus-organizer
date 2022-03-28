# class UserController < ApplicationController
#     def index
#         #redirect_to root_path if current_user.role == 1 or current_user.role == 2
#     end

#     def update
#         redirect_to root_path if current_user.role == 1 or current_user.role == 2
#         @user = User.find(params[:id])
#         if @user.update(user_params)
#           redirect_to(admins_path(@user))
#         else
#           flash[:errors] = @user.errors.full_messages
#           redirect_to edit_admins_path
#         end
#       end

#     def delete
#         redirect_to root_path if current_user.role == 1 or current_user.role == 2
#         @user = User.find(params[:id])
    
#     end

#     def destroy
#         redirect_to root_path if current_user.role == 1 or current_user.role == 2
#         @user = User.find(params[:id])
#         @user.destroy
#         redirect_to(admins_path)
#     end

#     def user_params
#         params.require(:user).permit(:name, :email, :role)
#       end

# end