class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit , :update, :destroy ]
  def index
    @topics = Topic.all
  end

  def new
    @user = current_user
    @topic = Topic.new
  end

  def create
    @user = current_user
    @topic = current_user.topics.new(topic_params)
    @topic.user = @user
      if @topic.save
        redirect_to topic_path(@topic)
      else
        render :new
      end
  end

  def show
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to topic_path(@topic)
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_path(@topics)
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :content, :link, :user_id)
  end
end
