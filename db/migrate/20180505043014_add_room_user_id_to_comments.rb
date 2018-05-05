class AddRoomUserIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :room_user, foreign_key: true
  end
end
