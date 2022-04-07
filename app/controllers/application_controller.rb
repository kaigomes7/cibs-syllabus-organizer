class ApplicationController < ActionController::Base
    if Rails.env != 'test'
        before_action :authenticate_user!
    end

    def reviewer?
        if Rails.env == 'test'
            return ENV['TEST_USER'] == 'reviewer'
        else
            return User.find_by_id(current_user.id).role == 2
        end
    end

    def admin?
        if Rails.env == 'test'
            return ENV['TEST_USER'] == 'admin'
        else
            return User.find_by_id(current_user.id).role == 0
        end
    end

    def student?
        if Rails.env == 'test'
            return ENV['TEST_USER'] == 'student'
        else
            return User.find_by_id(current_user.id).role == 1
        end
    end
end
