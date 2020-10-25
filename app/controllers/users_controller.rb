class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
    @favorite_articles = @user.favorite_articles
  end

  def follows
    @user = User.find(params[:id])
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    @user = User.find(params[:id])
    user = User.find(params[:id])
    @users = user.followers
  end
end
