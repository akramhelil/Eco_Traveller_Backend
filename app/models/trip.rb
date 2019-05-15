class Trip < ApplicationRecord
    belongs_to :traveller
    has_many :posts
end
