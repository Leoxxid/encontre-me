class Tag < ApplicationRecord
    has_many :taggings
    has_many :users, through: :taggings
end
