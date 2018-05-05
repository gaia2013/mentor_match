class AddIndexToRoomUsers < ActiveRecord::Migration[5.1]
  def change
    add_index :room_users, [:room_id, :user_id], unique: true
  end
end
