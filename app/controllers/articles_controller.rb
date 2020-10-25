class ArticlesController < ApplicationController

    def index
      @articles = Article.all
    end

    def new
      @article = Article.new
    end

    def create
			@article = Article.new(article_params)
			@article.user_id = current_user.id
			@article.save
			redirect_to articles_path
    end

		def show
      @article = Article.find(params[:id])
      @user = @article.user
		end

		def edit

		end
		

    def update

    end

    def destroy
      @article = Article.find(params[:id])
      @article.destroy
      redirect_to articles_path
    end

    private
			def article_params
				params.require(:article).permit(:body,:title)
			end
end
