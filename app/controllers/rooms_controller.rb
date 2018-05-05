class RoomsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @rooms = Room.page(params[:page])
  end

  def show
      @room = Room.find(params[:id])
      @comment = Comment.new
      @comments = @room.comments
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if  @room.save
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
