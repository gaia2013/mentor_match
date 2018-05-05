class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    room_users_ids = @user.room_users.pluck(:id)
    @comments = Comment.where(room_user_id: room_users_ids)

  end
end
