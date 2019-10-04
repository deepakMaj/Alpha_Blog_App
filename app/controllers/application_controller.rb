class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in? #Recoginzed as hepler's method

  def current_user
    #This means @current_user || @current_user = SOMETHING will be returned
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user #This checks wethher current_user is returned or not
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform this action"
      redirect_to root_path
    end
  end

end
