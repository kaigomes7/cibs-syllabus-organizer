class ApplicationController < ActionController::Base
    if Rails.env != 'test'
        before_action :authenticate_user!
    end
end
