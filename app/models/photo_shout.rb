class PhotoShout < ActiveRecord::Base
  attr_accessible :image
  has_attached_file :image, styles: {
    shout: "100x100#"
  }
end
