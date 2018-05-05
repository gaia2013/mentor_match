class Comment < ApplicationRecord
  has_many :room_users

  belongs_to :user
  belongs_to :room

  validates :body,    presence:true
  validates :user_id, presence:true
  validates :room_id, presence:true
end
