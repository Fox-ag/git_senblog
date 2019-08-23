class BlogsController < ApplicationController
    def index
        @blogs = Blog.order("created_at DESC").page(params[:page]).per(5)
    end
    
    def new
    end
    
    def create
        Blog.create(user_name: blog_params[:user_name], title: blog_params[:title], text: blog_params[:text], user_id: current_user.id)
    end
    
    def destroy
       blog = Blog.find(params[:id])
       if blog.user_id == current_user.id
           blog.destroy
       end
    end
    
    private
    def blog_params
        params.permit(:user_name, :title, :text)
    end
end
