class User < ActiveRecord::Base
  include Clearance::User
  has_many :shouts

  has_many :followed_user_relationships, foreign_key: "follower_id", class_name: "FollowingRelationship"
  has_many :followed_users, through: :followed_user_relationships

  has_many :follower_relationships, foreign_key: "followed_user_id", class_name: "FollowingRelationship"
  has_many :followers, through: :follower_relationships

  def can_follow? user
    self_and_followed_user_ids.exclude? user.id
  end

  def timeline
    Timeline.new(self_and_followed_user_ids)
  end

  def public_timeline
    Timeline.new(id)
  end

  private

  def self_and_followed_user_ids
    [id] + followed_user_ids
  end
end
