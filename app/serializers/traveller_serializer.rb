class TravellerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :profile_photo, :email, :about

  has_many :trips
  has_many :posts, through: :trips
end
