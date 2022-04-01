class User < ApplicationRecord
    has_one :student, dependent: :destroy
    has_one :reviewer, dependent: :destroy
    devise :omniauthable, omniauth_providers: [:google_oauth2]
    validates :name, :email, :uid, presence: true
    def self.from_google(email:, full_name:, uid:)
        #return nil unless email =~ /@tamu.edu\z/
        create_with(uid: uid, email: email, name: full_name, role: 1).find_or_create_by!(uid: uid)  
    end

end
