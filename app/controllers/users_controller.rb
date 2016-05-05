class UsersController < ApplicationController

  def create #sign up a new user
    @user = User.new(user_params)
    @user.password=(user_params[:password])
    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user.id)
    else
      flash.now[:errors] = @user.errors.full_messages
      #don't forget to implement this in html
      render :new
    end
  end

  def new #render signup page, persisting data after errors
    @user = User.new
    render :new
  end

  def show
    render :show
  end


  def user_params
    params.require(:user).permit(:email, :password)
    #do i need a session token here? seems like i would
  end


end
