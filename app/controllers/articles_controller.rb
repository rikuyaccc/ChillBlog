class ArticlesController < ApplicationController

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.find(params[:id])
        @article.create
    end

    def show
    end

    def update

    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
    end
end
