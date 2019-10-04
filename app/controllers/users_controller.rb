class UsersController < ApplicationController

  before_action :set_action, only: [:edit, :update, :show]

  def index
    @users = User.paginate(page: params[:page], per_page: 4)
  end

  def new
    @user = User.new
  end

  def create
    if @user.save
      flash[:success] = "Welcome to the Alpha Blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update

    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 2)
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def set_action
      @user = User.find(params[:id])
    end
end
