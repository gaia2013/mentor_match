class RoomUser < ApplicationRecord
  belongs_to :user
  belongs_to :room, counter_cache: :room_users_count
  # belongs_to :comment

  validates :user_id, presence: true
  validates :room_id, presence: true
end
