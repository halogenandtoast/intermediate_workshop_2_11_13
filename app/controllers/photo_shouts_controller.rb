class PhotoShoutsController < ApplicationController
  def create
    shout = build_shout
    if shout.save
      redirect_to dashboard_path, notice: "Shouted!"
    else
      redirect_to dashboard_path, alert: "Could not shout"
    end
  end

  private

  def build_shout
    photo_shout = PhotoShout.new(params[:photo_shout])
    current_user.shouts.build(content: photo_shout)
  end
end
