class ApplicationController < ActionController::Base
    if Rails.env != 'test'
        before_action :authenticate_user!
    end

    def reviewer?
        if Rails.env == 'test'
            return ENV['TEST_USER'] == 'reviewer'
        else
            return Reviewer.exists?(user_id: current_user.id)
        end
    end

    def admin?
        if Rails.env == 'test'
            return ENV['TEST_USER'] == 'admin'
        else
            return Admin.exists?(user_id: current_user.id)
        end
    end

    def student?
        if Rails.env == 'test'
            return ENV['TEST_USER'] == 'student'
        else
            return Student.exists?(user_id: current_user.id)
        end
    end
end
