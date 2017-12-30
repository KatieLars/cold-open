module UsersHelper

  def admin_or_no
    if current_user.admin?
      "Yes"
    else
      "No"
    end
  end

  def user_errors(user)
    if user.errors.any?
      user.errors.full_messages.each do |message|
        message
      end
    end
  end

end
