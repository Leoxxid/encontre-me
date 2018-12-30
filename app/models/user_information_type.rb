class UserInformationType < ApplicationRecord
  belongs_to :user
  belongs_to :information_type
  has_one :user_information
  has_one :sugestion
end
