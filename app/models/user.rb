class User < ApplicationRecord
    devise :omniauthable, omniauth_providers: [:google_oauth2]
    validates :name, :email, :uid, presence: true
    def self.from_google(email:, full_name:, uid:)
<<<<<<< HEAD
        return nil unless email =~ /@tamu.edu\z/
        create_with(uid: uid, email: email, name: full_name).find_or_create_by!(uid: uid)  
=======
        create_with(uid: uid, email: email, name: full_name).find_or_create_by!(uid: uid)
>>>>>>> 3bce208eee08929db1ed95d25388aa4a934be7f6
    end

end
