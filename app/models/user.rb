class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :user_information_types, inverse_of: :user, dependent: :destroy
  # has_many :information_types, dependent: :destroy
  has_many :information_types, through: :user_information_types, dependent: :destroy
  has_many :sugestions, dependent: :destroy
  has_one_attached :avatar
  has_many :taggings
  has_many :tags, through: :taggings

  accepts_nested_attributes_for :user_information_types, allow_destroy: true

  def self.tagged_with(name)
    Tag.find_by!(name: name).users
  end

  def self.tag_counts
    Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end



end
