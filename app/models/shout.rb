class Shout < ActiveRecord::Base
  belongs_to :user
  belongs_to :content, polymorphic: true
  validates_associated :content

  attr_accessible :content

  delegate :email, to: :user, prefix: true

  def self.reverse_chronological
    order("created_at DESC")
  end
end
