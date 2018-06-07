class CommentsController < ApplicationController
  def create
    @user = current_user
    @topic = Topic.find(params[:topic_id])
    @comment = current_user.comments.new(comment_params)
    @comment.topic = @topic
    @comment.user = @user
    if @comment.save
      redirect_to topic_path(@topic)
    else
      render 'topics/show'
    end
  end



  def show
    @topic = Topic.find(params[:id])
    @comment = Comment.new
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :link, :user_id)
  end
end
