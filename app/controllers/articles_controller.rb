class ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:create, :update, :destroy]
  before_action :admin_user,     only: :approve

  def index
    @articles = Article.order('created_at DESC')
  end

  def approved
    @articles = Article.where(approved: true)
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
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:danger] = 'Article deleted.'
      redirect_to request.referrer || articles_path
    end
  end

  def approve
    @article = Article.find(params[:id])
    @article.toggle!(:approved)
    if @article.approved?
      flash[:success] = 'Article approved.'
      redirect_to request.referrer || articles_path
    else
      flash[:danger] = 'Article approval revoked.'
      redirect_to request.referrer || articles_path
    end
  end

  private

    def article_params
      params.require(:article).permit(:title, :body, :category_id)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = 'Please log in.'
        redirect_to login_url
      end
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
