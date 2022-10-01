class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
    def index
      @articles = Article.all
    end

    def new
      @article = Article.new
    end

    def create
      @article = Article.new(whitelist_params)
      if @article.save
        flash[:success] = 'Article Saved'
        redirect_to_home
      else
        flash[:error] = 'Something went wrong'
        render 'new'
      end
    end

    def show
    end

    def edit
    end

    def update
      if @article.update(whitelist_params)
        render 'show'
        flash[:success] = 'Article Updated'
      else
        flash[:error] = 'Something went wrong'
      end
    end

    def destroy
      if @article.destroy
        flash[:success] = 'Article Deleted'
      else
          flash[:error] = 'Something went wrong'
      end
      redirect_to_home
    end 

    private
      def set_article
        @article = Article.find(params[:id])
      end

      def whitelist_params
        params.require(:article).permit(:title, :description)
      end

      def redirect_to_home
        redirect_to articles_path
      end
end
