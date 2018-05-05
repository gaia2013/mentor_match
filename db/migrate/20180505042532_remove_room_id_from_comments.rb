class RemoveRoomIdFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :room_id, :integer
  end
end
