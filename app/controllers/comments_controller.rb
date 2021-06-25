class CommentsController < ApplicationController
    def create
        comment = Comment.create(text: comment_params[:text], blog_id: comment_params[:blog_id], user_id: current_user.id)
        @blog.create_notification_comment!(current_user, @comment.id)
        redirect_to "/blogs/#{comment.blog.id}/detailpage"
    end
    
    def destroy
        @blog = Blog.find(params[:blog_id])
        comment = @blog.comments.find(params[:id])
        if current_user.id == comment.user.id
            comment.destroy
        redirect_to "/blogs/#{comment.blog.id}/detailpage"
        end
    end
    
    private
    def comment_params
        params.permit(:text, :blog_id)
    end
end
