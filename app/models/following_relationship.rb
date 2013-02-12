class FollowingRelationship < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :followed_user, class_name: "User"

  after_create :send_follow_notification

  def send_follow_notification
    Mailer.follow_notification(self).deliver
  end
end
