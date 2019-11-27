class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to root_path, notice: 'コメントを作成しました'
    else
      render create
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(item_id: params[:item_id], user_id: 1)
    # あとでuser_id: current_user.id に変える。
  end
end

