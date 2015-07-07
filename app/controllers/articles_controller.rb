class ArticlesController < ApplicationController
  #before_action :logged_in_user, only: [:create, :destroy]
  #before_action :correct_user,   only: :destroy :edit

  def index
    @articles = Article.order('created_at DESC')
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = 'Article posted.'
      redirect_to articles_path
    else
      render action: 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      flash[:warning] = 'Article updated.'
      redirect_to articles_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:danger] = 'Article deleted.'
    redirect_to request.referrer || articles_path
  end

  private

    def article_params
      params.require(:article).permit(:title, :body)
    end

    def correct_user
      @article = current_user.articles.find_by(id: params[:id])
      redirect_to articles_path if @article.nil?
    end
end
