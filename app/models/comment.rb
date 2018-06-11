class Comment < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  validates :content, presence: true

  after_commit :create_notifications, on: :create



  private

  def create_notifications
    Notification.create do |notification|
      notification.notify_type = 'topic'
      notification.actor = self.user
      notification.user = self.topic.user
      notification.target = self
      notification.second_target = self.topic
    end
  end
end


