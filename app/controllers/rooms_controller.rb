class RoomsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    # @rooms = Room.page(params[:page])
    @q = Room.ransack(params[:q])
    @rooms = @q.result.page(params[:page])
  end

  def show
      RoomUser.order('room_user_id ASC')
      @room = Room.find(params[:id])
      @comment = Comment.new
      room_users_ids = @room.room_users.pluck(:id)
      @comments = Comment.where(room_user_id: room_users_ids).order('created_at ASC')
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if  @room.save
      @room_user = @room.room_users.build(user_id: current_user.id)
      @room_user.save
    redirect_to @room
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to @room
    else
      render :edit
    end
  end

  def destroy
      @room = Room.find(params[:id])
      @room.destroy
      redirect_to root_path
  end

  private

    def room_params
      params.require(:room).permit(
        :name,
        :content
      )
    end
end
