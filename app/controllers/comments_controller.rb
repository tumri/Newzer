class CommentsController < ApplicationController

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
        redirect_to comment_path(@comment)
      end
    else
      @article = Article.find(params[:article_id])
      @comment = current_user.comments.create(comment_params)
      @comment.article_id = @article.id

      if @comment.save
        flash[:success] = 'Comment added.'
        redirect_to article_path(@article)
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
end
