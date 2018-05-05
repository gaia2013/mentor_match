class Room < ApplicationRecord
  has_many :users, through: :room_users
  has_many :room_users, dependent: :destroy
  has_many :comments, through: :room_users

  validates :name, presence: true, length:{maximum: 50}
  validates :content, presence: true, length:{ maximum: 500}

  accepts_nested_attributes_for :room_users
end
