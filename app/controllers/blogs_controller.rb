class BlogsController < ApplicationController
    def index
        @blogs = Blog.order("created_at DESC").page(params[:page]).per(5)
    end
    
    def new
    end
    
    def create
        Blog.create(user_name: blog_params[:user_name], image: blog_params[:image], text: blog_params[:text], user_id: current_user.id)
    end
    
    private
    def blog_params
        params.permit(:user_name, :image, :text)
    end
end
