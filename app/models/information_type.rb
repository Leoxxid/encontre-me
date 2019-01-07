class InformationType < ApplicationRecord
  # validates :description, presence: true
  has_many :user_information_types, dependent: :destroy
  # belongs_to :user, required: false

  def name_with_initial
    "#{description}"
  end
end
