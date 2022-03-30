class ApplicationController < ActionController::Base
    if Rails.env != 'test'
        before_action :authenticate_user!
    end

    def reviewer?
        return Reviewer.exists?(user_id: current_user.id)
    end

    def admin?
        return Admin.exists?(user_id: current_user.id)
    end

    def student?
        return Student.exists?(user_id: current_user.id)
    end
end
