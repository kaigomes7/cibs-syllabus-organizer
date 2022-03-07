module ApplicationHelper
    # if the current user is logged in 
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
    
end
