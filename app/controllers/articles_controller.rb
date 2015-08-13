class ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:create,
                                        :edit,
                                        :update,
                                        :destroy,
                                        :report]

  before_action :power_user,     only: [:approve,
                                        :feature,
                                        :reported]

  def index
    @articles = Article.paginate(page: params[:page],
                                 per_page: 10
                                ).order('created_at DESC')
  end

  def reported
    @articles = Article.paginate(page: params[:page],
                                 per_page: 10
                                ).where(approved: false,
                                        reported: true).order('created_at DESC')
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
      redirect_to article_path(@article)
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

  def report
    @article = Article.find(params[:id])
    if @article.approved?
      flash[:danger] = 'Article is approved and cannot be reported.'
      redirect_to request.referrer || articles_path
    elsif @article.reported?
      flash[:warning] = 'Article is already reported.'
      redirect_to request.referrer || articles_path
    else
      @article.update_column(:reported, true)
      if @article.reported?
        flash[:warning] = 'Article reported.'
        redirect_to request.referrer || articles_path
      else
        flash[:danger] = '[Error] Article was not reported. Try again.'
        redirect_to request.referrer || articles_path
      end
    end
  end

  def approve
    @article = Article.find(params[:id])
    @article.toggle!(:approved)
    if @article.approved?
      flash[:success] = 'Article approved.'
      if @article.reported?
        @article.update_column(:reported, false)
      end
      redirect_to articles_path(@article)
    else
      flash[:danger] = 'Article unapproved.'
      redirect_to articles_path(@article)
    end
  end

  def feature
    @article = Article.find(params[:id])
    @article.toggle!(:featured)
    if @article.featured?
      flash[:success] = 'Article featured.'
      redirect_to articles_path(@article)
    else
      flash[:danger] = 'Article unfeatured.'
      redirect_to articles_path(@article)
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

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def mod_user
      redirect_to(root_url) unless current_user.mod?
    end
end
