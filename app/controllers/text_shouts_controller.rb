class TextShoutsController < ApplicationController
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
    text_shout = TextShout.new(params[:text_shout])
    current_user.shouts.build(content: text_shout)
  end
end
