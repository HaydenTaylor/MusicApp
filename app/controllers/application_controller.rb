class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?
  helper_method :my_link_to

  include ApplicationHelper

  def current_user
    return nil unless session[:session_token]
    User.find_by(session_token: session[:session_token])
    #this find_by might not work right
  end

  def logged_in?
    !current_user.nil?
  end

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def log_out_user!(user)
    user.reset_session_token!
    session[:session_token] = nil
  end

  def my_link_to(body, url)

    <<-HTTP.html_safe
    <a href="#{url}">#{body}</a>
    HTTP
  end

end
