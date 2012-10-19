class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  private

  def login_required
     if current_user.present?
       return true
     else
      redirect_to log_in_path
     end

  end


  def current_user

#   if @current_user not defined  then assign  it   (that what the ||=)
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
