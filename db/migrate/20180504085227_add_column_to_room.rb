class AddColumnToRoom < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :content, :string
  end
end
