class BlogsController < ApplicationController
    def index
        @blogs = Blog.order("created_at DESC").page(params[:page]).per(5)
    end
    
    def detailpage
        @blog = Blog.find(params[:id])
        @like = Like.new
    end
    
    def new
        @blog = Blog.new
    end
    
    def show
        @blog = Blog.find(params[:id])
        @like = Like.new
    end
    
    def create
        Blog.create(blog_params)
    end
    
    def destroy
       blog = Blog.find(params[:id])
       if blog.user_id == current_user.id
           blog.destroy
       end
    end
    
    def edit
        @blog = Blog.find(params[:id])
    end
    
    def update
        blog = Blog.find(params[:id])
        if blog.user_id == current_user.id
            blog.update(blog_params)
        end
    end
    
    def search
        @blogs = Blog.where('title LIKE(?)', "%#{params[:keyword]}%")
    end
    
    private
    def blog_params
        params.require(:blog).permit(:user_name, :title, :text).merge(user_id: current_user.id)
    end
end
