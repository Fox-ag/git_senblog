class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(blog_id: params[:blog_id])
    @blog = Blog.find(params[:blog_id])
    @blog.create_notification_like!(current_user)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(blog_id: params[:blog_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
