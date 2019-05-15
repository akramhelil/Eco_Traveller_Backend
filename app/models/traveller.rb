class Traveller < ApplicationRecord
    validates :username, :password, presence: true
    validates :email, :username, uniqueness: true

    has_many :trips
    has_many :posts, through: :trips


end
