class Comment < ApplicationRecord
    belongs_to :traveller
    belongs_to :post
end
