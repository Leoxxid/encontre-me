class InformationType < ApplicationRecord
  validates :description, presence: true
  has_many :user_information_type, dependent: :destroy
end
