class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.new(article_id: params[:article_id])
    favorite.save
    @article = Article.find(params[:article_id])
    redirect_to article_path(@article.id)
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, article_id: params[:article_id])
    favorite.destroy
    @article = Article.find(params[:article_id])
    redirect_to article_path(@article.id)
  end
end
