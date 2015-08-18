class CommentsController < ApplicationController
  before_action :logged_in_user,  only: [:create,
                                         :delete,
                                         :flag,
                                         :flagged,
                                         :unflag]

  before_action :authorized_user, only:  :delete

  before_action :power_user,      only: [:flagged,
                                         :unflag]

  def show
    @comment = Comment.find(params[:id])
  end

  def flagged
    @comments = Comment.paginate(page: params[:page],
                                 per_page: 100
                                ).where(unflagged: false,
                                        flagged: true).order('created_at DESC')
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
        # flash[:success] = 'Reply added.'

        respond_to do |format|
          format.html { redirect_to article_path(@comment.article) }
          format.js   {  }
        end

      else
        flash[:warning] = 'Replies must be between 10 and 1000 characters.'
        redirect_to request.referrer
      end

    else
      @article = Article.find(params[:article_id])
      @comment = current_user.comments.create(comment_params)
      @comment.article_id = @article.id

      if @comment.save
        flash[:success] = 'Comment added.'
        redirect_to article_path(@comment.article)
      else
        flash[:warning] = 'Comments must be between 10 and 1000 characters.'
        redirect_to request.referrer
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:danger] = 'Comment deleted.'
      redirect_to request.referrer
    end
  end

  def flag
    @comment = Comment.find(params[:id])
    if @comment.unflagged?
      flash[:danger] = 'This comment was already flagged and approved.'
      redirect_to request.referrer || articles_path(@comment.article)
    elsif @comment.flagged?
      flash[:warning] = 'Comment flagged for inappropriate content.'
      redirect_to request.referrer || articles_path(@comment.article)
    else
      @comment.update_column(:flagged, true)
      if @comment.flagged?
        flash[:warning] = 'Comment flagged for inappropriate content.'
        redirect_to request.referrer || articles_path(@comment.article)
      else
        flash[:danger] = '[Error] Comment was not flagged. Please try again.'
        redirect_to request.referrer || articles_path(@comment.article)
      end
    end
  end

  def unflag
    @comment = Comment.find(params[:id])
    @comment.update_column(:flagged, false)
    @comment.update_column(:unflagged, true)
    if @comment.unflagged? && !@comment.flagged?
      flash[:success] = 'Comment unflagged.'
      redirect_to request.referrer || articles_path(@comment.article)
    else
      flash[:danger] = '[Error] Comment was not unflagged. Please try again'
      redirect_to request.referrer || articles_path(@comment.article)
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
      unless power_user?
        store_location
        flash[:danger] = 'Insufficient privileges.'
        redirect_to(root_url)
      end
    end

    def authorized_user
      @user = Comment.find(params[:id]).user
      unless power_user? || current_user?(@user)
        store_location
        flash[:danger] = 'Insufficient privileges.'
        redirect_to(root_url)
      end
    end
end
