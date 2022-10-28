class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
    # GET /articles or /articles.json

    def index
      @articles = Article.all
    end

    def show
    end

    def new
      @article = Article.new
    end

    def create
      @article = Article.new(article_params)
      if @article.save
        redirect_to @article
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @article.update(article_params)
        redirect_to @article
      else
        render :edit
      end
    end

    def destroy
      if @article.destroy
        redirect_to articles_path
      else
        redirect_to article_path(@article)
      end
    end

    private
      #ストロングパラメータでpermitに渡された値以外を受け取らないようにする
      def article_params
        params.require(:article).permit(:title,:content)
      end

      def set_article
        @article = Article.find(params[:id])
      end
end
