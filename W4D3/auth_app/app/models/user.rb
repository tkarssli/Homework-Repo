# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    attr_reader :password

    before_validation :ensure_session_token
    validates :username,  :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: {message: "Password can't be blank"}
    validates :password, length: {minimum:8, allow_nil: true}

    def self.find_by_credentials(username, password)

        user = User.find_by(username: username)
        digest = user.password_digest
        if BCrypt::Password.new(digest).is_password?(password)
            return user
        end

    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        self.session_token = User::generate_session_token
        self.save
    end

    def ensure_session_token
        self.reset_session_token! unless self.session_token
    end

    def password=(raw_pass)
        @password = raw_pass
        self.password_digest = BCrypt::Password.create(raw_pass)
    end




end
