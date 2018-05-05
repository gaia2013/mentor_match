class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      @room_user = RoomUser.new(room_id: @comment.room_id,user_id: current_user.id)
      @room_user.save
      redirect_to @comment.room
    else
      @room = @comment.room
      render template: "rooms/show"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.room
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :room_id, :user_id)
    end
end
