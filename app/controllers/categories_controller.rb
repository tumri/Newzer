class CategoriesController < ApplicationController
  def index
    @categories = Category.order('created_at ASC')
  end

  def show
    @category = Category.find(params[:id])
    @articles = Article.paginate(page: params[:page],
                                 per_page: 10
                                ).where(category_id: @category.id
                                       ).order('created_at DESC')
  end

  private

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = 'Please log in.'
        redirect_to login_url
      end
    end

    def power_user
      redirect_to(root_url) unless power_user?
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def mod_user
      redirect_to(root_url) unless current_user.mod?
    end
end
