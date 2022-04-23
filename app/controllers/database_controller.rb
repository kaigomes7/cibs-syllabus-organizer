class DatabaseController < ApplicationController
  def index
    redirect_to root_path if current_user.role == 1
    redirect_to root_path if current_user.role == 2
  end
end
