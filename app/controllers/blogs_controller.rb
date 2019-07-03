class BlogsController < ApplicationController
    def index
        @blogs = Blog.order("created_at DESC").page(params[:page]).per(5)
    end
    
    def new
    end
    
    def create
        Blog.create(blog_params)
    end
    
    private
    def blog_params
        params.permit(:user_name, :image, :text)
    end
end
