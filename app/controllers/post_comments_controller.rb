class PostCommentsController < ApplicationController

  # /post_images/:post_image_id/post_comments(.:format)
  def create
    post_image = PostImage.find(params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image.id)
  end

  # /post_images/:post_image_id/post_comments/:id(.:format)
  def destroy
    PostComment.find_by(id: params[:id],post_image_id: params[:post_image_id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end


  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end


end
