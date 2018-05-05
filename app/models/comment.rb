class Comment < ApplicationRecord
  belongs_to :room_user
  has_many :users, through: :room_users
  has_many :rooms, through: :room_users
  #
  # belongs_to :user
  # belongs_to :room

  validates :body,    presence:true
end
