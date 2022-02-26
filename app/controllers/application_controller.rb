class ApplicationController < ActionController::Base

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
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to user_url(current_user), alert: '操作権限がありません。'
  end
end