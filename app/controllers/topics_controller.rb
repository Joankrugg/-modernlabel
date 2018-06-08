class TopicsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index ]
  before_action :set_topic, only: [:show, :edit , :update, :destroy ]
  def index
    if params[:search].present?
      @topics = Topic.perform_search(params[:search])

    else
      @topics = Topic.all
    end
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
    @comment = Comment.new
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
