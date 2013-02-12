class Mailer < ActionMailer::Base
  default from: "from@example.com"

  def follow_notification(following_relationship)
    @follower = following_relationship.follower
    followed_user = following_relationship.followed_user
    mail(to: followed_user.email, subject: "You have a new follower")
  end
end
