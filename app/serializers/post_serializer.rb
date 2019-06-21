class PostSerializer < ActiveModel::Serializer
  attributes :id, :trip_id, :title, :likes,:content, :img_url

  belongs_to :trip
  has_many :comments
end