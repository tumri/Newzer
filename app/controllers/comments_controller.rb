class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create]
  before_action :power_user,     only: [:destroy]

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def index
    @comments = Comment.hash_tree
  end

  def create
    if params[:comment][:parent_id].to_i > 0
      parent = Comment.find_by_id(params[:comment].delete(:parent_id))
      @comment = parent.children.build(comment_params)
      @comment.user_id = current_user.id
      @comment.article_id = parent.article_id

      if @comment.save
        flash[:success] = 'Reply added.'
        redirect_to request_referrer || comment_path(@comment)
      end
    else
      @article = Article.find(params[:article_id])
      @comment = current_user.comments.create(comment_params)
      @comment.article_id = @article.id

      if @comment.save
        flash[:success] = 'Comment added.'
        redirect_to request_referrer || article_path(@article)
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to request.referrer
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
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
