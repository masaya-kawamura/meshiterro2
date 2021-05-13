class FavoritesController < ApplicationController


  # post_image_favorites POST
  # /post_images/:post_image_id/favorites(.:format)
  def create
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.new(post_image_id: post_image.id)
    favorite.save
    redirect_to post_image_path(post_image)
  end

  # post_image_favorites DELETE
  # /post_images/:post_image_id/favorites(.:format)
  def destroy
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    favorite.destroy
    redirect_to post_image_path(post_image)
  end

end
