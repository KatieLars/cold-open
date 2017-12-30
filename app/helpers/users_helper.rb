module UsersHelper

  def admin_or_no
    if current_user.admin?
      "Yes"
    else
      "No"
    end
  end
  
end
