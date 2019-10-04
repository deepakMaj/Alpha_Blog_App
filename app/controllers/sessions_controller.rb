class SessionsController < ApplicationController

  #Takes control of lofin action and logout action

  def new
    #Creating new login form
  end

  def create
    #Checking valid user
    #params[:session][:email] gives email of entered during current session
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "You have successfully logged in"
      redirect_to user_path(@user)
    else
      flash.now[:danger] = "Invalid Credentials"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil #Setting session[:user_id] to null
    flash[:success] = "You have logged out"
    redirect_to root_path
  end

end
