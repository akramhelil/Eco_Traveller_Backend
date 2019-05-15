class TripSerializer < ActiveModel::Serializer
  attributes :id, :traveller_id, :date, :name

  belongs_to :traveller
  has_many :posts
end
