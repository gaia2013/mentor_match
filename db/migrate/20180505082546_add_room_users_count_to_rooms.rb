class AddRoomUsersCountToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :room_users_count, :integer, default: 0
  end
end
