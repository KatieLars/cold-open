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
      user.errors.full_messages.e do |message|
        message
        binding.pry
      end
    end
    #THE RETURN VALUE OF THIS HELPER METhOD IS ACTUALLY AN ARRAY user.errors.full_messages
  end

end
