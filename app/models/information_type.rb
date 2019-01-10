class InformationType < ApplicationRecord
  # validates :description, presence: true
  
  has_many :user_information_types, dependent: :destroy
  has_many :users, through: :user_information_types

  def name_with_initial
    "#{description}"
  end
end
