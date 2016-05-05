class SessionsController < ApplicationController

  def create #login
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user.nil?
      flash.now[:errors] = ["Incorrect email and/or password"]
      render :new
    else
      log_in_user!(user)
      redirect_to user_url(user.id)
    end
  end

  def destroy #log out
    user = User.find_by(session_token: session[:session_token])
    log_out_user!(user)
    redirect_to new_session_url
  end

  private


end
