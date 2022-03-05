class User < ApplicationRecord
    devise :omniauthable, omniauth_providers: [:google_oauth2]
    
    def self.from_google(email:, full_name:, uid:)
        create_with(uid: uid, name: full_name).find_or_create_by!(uid: uid)
    end
end
