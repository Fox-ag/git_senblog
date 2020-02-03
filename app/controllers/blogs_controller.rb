class BlogsController < ApplicationController
    def index
        @blogs = Blog.order("created_at DESC").page(params[:page]).per(5)
    end
    
    def detailpage
        @blog = Blog.find(params[:id])
        @like = Like.new
        @blog_photos = @blog.blog_photos.all
    end
    
    def new
        @blog = Blog.new
        @emotions = Emotion.all
        @blog.blog_feelings.build
        @blog_photo = @blog.blog_photos.build
    end
    
    def show
        @blog = Blog.find(params[:id])
        @like = Like.new
        @blog_photos = @blog.blog_photos.all
    end
    
    def create
        # Blog.create(blog_params)
        @blog = Blog.new(blog_params) 
        
        
            respond_to do |format|
                if params[:blog_photos]==nil && @blog.save
                format.html { redirect_to @blog, notice: 'Item was successfully created.' }
                
                elsif @blog.save
                  params[:blog_photos]['photo'].each do |a|
                   @blog_photo = @blog.blog_photos.create!(:photo => a)
                  end
                format.html { redirect_to @blog, notice: 'Item was successfully created.' }
                
                else
                format.html { redirect_to @blog, notice: 'Item was not created.' }
                end
            end
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
        # blog = Blog.find(params[:id])
        # if blog.user_id == current_user.id
        #     blog.update(blog_params)
        # end
        
        @blog = Blog.find(params[:id])
        respond_to do |format|
                if params[:blog_photos]==nil && @blog.update(blog_params)
                format.html { redirect_to @blog, notice: 'Item was successfully created.' }
                
                elsif @blog.update(blog_params)
                  params[:blog_photos]['photo'].each do |a|
                   @blog_photo = @blog.blog_photos.create!(:photo => a)
                  end
                format.html { redirect_to @blog, notice: 'Item was successfully created.' }
                
                else
                format.html { redirect_to @blog, notice: 'Item was not created.' }
                end
            end
        
        
    end
    
    # def search
    #     @blogs = Blog.where('title LIKE(?)', "%#{params[:keyword]}%")
    # end
    
    def search
        # @blogs = Blog.order("created_at DESC").page(params[:page]).per(5)
        
        @blogs = Blog.where('title LIKE(?)', "%#{params[:keyword]}%")
        @q = Blog.search(search_params)
        params.require(:q).permit(:title_cont)
        @bloges = @q.result.includes(:emotions)
    end
    
    private
    def search_params
        params.require(:q).permit!
    end
    
    def blog_params
        params.require(:blog).permit(:user_name, :title, :text, blog_photos_attributes: [:id, :blog_id, :photo], emotion_ids: []).merge(user_id: current_user.id)
    end
    
end
