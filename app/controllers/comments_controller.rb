class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    flash[:notice] = @comment.errors.full_messages.to_sentence unless @comment.save

    redirect_to post_path(@comment.post)
  end

  def edit; end

  def update; end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to post_path(@comment.post), notice: 'Comment was successfully destroyed.' }
    end
  end

  def new
    @comment = Comment.new
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(post_id: params[:post_id])
  end
end
