class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show ]
  before_action :ensure_user, only: [:edit, :update, :destroy,]
    # GET /articles or /articles.json

    def index
      @articles = Article.all
    end

    def show
      # @user = @article.user
      @article = Article.find(params[:id])
    end

    def new
      @article = Article.new
    end

    def create
      @article = Article.new(article_params)
      @article.user_id = current_user.id
      if @article.save
        flash[:success] = "記事を作成しました"
        redirect_to articles_path
      else
        flash.now[:alert] = '記事を作成に失敗しました'
        render :new
      end
    end

    def edit
    end

    def update
      if @article.update(article_params)
        flash[:success] = '記事が編集されました'
        redirect_to articles_path
      else
        flash.now[:alert] = '記事の編集に失敗しました'
        render :edit
      end
    end

    def destroy
      if @article.destroy
        flash[:success] = '記事が削除されました'
        redirect_to articles_path
      else
        flash.now[:alert] = '記事の削除に失敗しました'
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

      def ensure_user
        @articles = current_user.articles
        @article = @articles.find_by(id: params[:id])
        redirect_to article_path unless @article
      end
end
