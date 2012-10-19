class SessionsController < ApplicationController

# skip before filter -- for login because this will cause an endless loop (we are not loop)
# this filter is defined in the application_controller.rb
  skip_before_filter :login_required

  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id

     logger.debug("params are #{params.inspect}")    # show just the params returned from browser
#     logger.debug("params are #{params.request}")    # show the entire request returned from browser
      redirect_to root_url, :notice => "Logged in!"
#      redirect_to session[:return_to_url], :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end


end
