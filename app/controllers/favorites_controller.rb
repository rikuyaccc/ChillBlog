class FavoritesController < ApplicationController

  def create
    @favorite = current_user.favorites.new(article_id: params[:article_id])
    @favorite.save
    redirect_to articles_path
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, article_id: params[:article_id])
    @favorite.destroy
    redirect_to articles_path
  end
end
