class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :traveller_id, :post_id
end
