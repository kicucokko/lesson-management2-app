class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_up_path_for(resource)
    case resource
    when User
      user_path(current_user.id)
    end
  end
  def after_sign_in_path_for(resource)
    case resource
    when User
      user_path(current_user.id) 
    end
  end
end