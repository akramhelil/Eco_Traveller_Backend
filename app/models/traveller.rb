class Traveller < ApplicationRecord
    validates :username, :password_digest, presence: true
    validates :email, :username, uniqueness: true

    has_secure_password
    
    has_many :trips
    has_many :posts, through: :trips
end
