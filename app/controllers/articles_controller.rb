class ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :update, :destroy]
  before_action :power_user,     only: [:approve, :feature]

  def index
    @articles = Article.paginate(page: params[:page],
                                 per_page: 10
                                ).order('created_at DESC')
  end

  def approved
    @articles = Article.paginate(page: params[:page],
                                 per_page: 10
                                ).where(approved: true).order('created_at DESC')
  end

  def featured
    @articles = Article.paginate(page: params[:page],
                                 per_page: 10
                                ).where(approved: true,
                                        featured: true).order('created_at DESC')
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
      flash[:danger] = 'Article unapproved.'
      redirect_to request.referrer || articles_path
    end
  end

  def feature
    @article = Article.find(params[:id])
    @article.toggle!(:featured)
    if @article.featured?
      flash[:success] = 'Article featured.'
      redirect_to request.referrer || articles_path
    else
      flash[:danger] = 'Article unfeatured.'
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

    def power_user
      redirect_to(root_url) unless current_user.admin? || current_user.mod?
    end
end
