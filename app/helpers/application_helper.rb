module ApplicationHelper
  def follow_button(user)
    if signed_in?
      if current_user.can_follow?(user)
        button_to "Follow", user_follow_path(user)
      elsif current_user != user
        "Following"
      end
    end
  end
end
