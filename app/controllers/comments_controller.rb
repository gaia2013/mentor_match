class CommentsController < ApplicationController

  def create
    @room_user = RoomUser.find_or_create_by(room_id: params[:room_id].to_i, user_id: current_user.id)
    @comment = Comment.new(comment_params.merge(room_user_id: @room_user.id))
    if @comment.save
      redirect_to @room_user.room
    else
      @room = @comment.room
      render template: "rooms/show"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.room_user.room
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
