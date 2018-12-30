class Sugestion < ApplicationRecord
  belongs_to :user
  belongs_to :user_information_type
end
