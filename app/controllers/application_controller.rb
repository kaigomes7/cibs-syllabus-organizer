# frozen_string_literal: true

class ApplicationController < ActionController::Base
    def is_logged_in?
        !!session[:user_id]
    end

    def is_student?
        5 > 1
        # if boolean in roles table is null for this specific uin/user id
        # return true
        # else return false
    end

    def is_admin?
        5 > 1
    end

    def is_reviewer?
        5 > 1
    end

    # who the current user is
    def current_user
        @current_user || User.find(session[:user_id]) if is_logged_in?
    end 
end
