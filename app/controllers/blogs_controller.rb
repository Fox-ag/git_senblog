class BlogsController < ApplicationController
    before_action :move_to_index
    def index
        @blogs = Blog.order("created_at DESC").page(params[:page]).per(5)
    end
    
    def detailpage
        @blog = Blog.find(params[:id])
        @like = Like.new
        @blog_photos = @blog.blog_photos.all
        @blog_images = @blog.blog_images.all
    end
    
    def topmap
        @blogkanagawas = Blog.order("created_at DESC").where(status: 'published').joins(:user).where("users.prefecture = ?","神奈川").limit(1)
        # @blogkanagawaemotions = @blogkanagawas.joins(:blog_feelings).select('blog_feelings.emotion_id')
        @blogkanagawaemotions = @blogkanagawas.joins(:blog_feelings).select('blogs.*,blog_feelings.emotion_id')
        
        # @blogkanagawadatas = @blogkanagawaemotions.order('emotion_id DESC').limit(1).count(:emotion_id)
    
        # @blogkanagawaemotions = @blogkanagawas.joins(:blog_feelings).order('count_blogfeelings.emotion_id DESC').limit(1).count(:emotion_id).select('blog_feelings.emotion_id')
        
    end
    
    def new
        @blog = Blog.new
        @emotions = Emotion.all
        @blog.blog_feelings.build
        @themes = Theme.all
        @blog.blog_topics.build
        @blog_photo = @blog.blog_photos.build
        @blog_image = @blog.blog_images.build
    end
    
    def show
        @blog = Blog.find(params[:id])
        @like = Like.new
        @blog_photos = @blog.blog_photos.all
        @blog_images = @blog.blog_images.all
    end
    
    def create
        # Blog.create(blog_params)
        @blog = Blog.new(blog_params)
        
            respond_to do |format|
                if params[:blog_photos]==nil && params[:blog_images]==nil && @blog.save
                   @blog_image = @blog.blog_images.create!(:image => 'edit-24px.png')   #何故かいれておかないとimage_uploader.rbのdefault画像機能が動作しない。
                   @blog_photo = @blog.blog_photos.create!(:photo => 'edit-24px.png')   #何故かいれておかないとimage_uploader.rbのdefault画像機能が動作しない。
                format.html { redirect_to @blog, notice: 'Item was successfully created.' }
                
                elsif params[:blog_photos]==nil && params[:blog_images]!=nil && @blog.save
                   @blog_photo = @blog.blog_photos.create!(:photo => 'edit-24px.png')   #何故かいれておかないとimage_uploader.rbのdefault画像機能が動作しない。
                  params[:blog_images]['image'].each do |b|
                   @blog_image = @blog.blog_images.create!(:image => b)
                  end
                format.html { redirect_to @blog, notice: 'Item was successfully created.' }
                    
                elsif params[:blog_photos]!=nil && params[:blog_images]==nil && @blog.save
                   @blog_image = @blog.blog_images.create!(:image => 'edit-24px.png')   #何故かいれておかないとimage_uploader.rbのdefault画像機能が動作しない。
                  params[:blog_photos]['photo'].each do |a|
                   @blog_photo = @blog.blog_photos.create!(:photo => a)
                  end
                format.html { redirect_to @blog, notice: 'Item was successfully created.' }
                
                elsif @blog.save
                  params[:blog_photos]['photo'].each do |a|
                   @blog_photo = @blog.blog_photos.create!(:photo => a)
                  end
                  params[:blog_images]['image'].each do |b|
                   @blog_image = @blog.blog_images.create!(:image => b)
                  end
                format.html { redirect_to @blog, notice: 'Item was successfully created.' }
                
                else
                format.html { render 'blogs/new', notice: 'Item was not created.' }
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
       
        #↓この辺いらないコマンドがありますな。
        respond_to do |format|
                if params[:blog_photos]==nil && params[:blog_images]==nil && @blog.update(blog_params)
                format.html { redirect_to @blog, notice: 'Item was successfully created.' }
                
                elsif params[:blog_photos]==nil && params[:blog_images]!=nil && @blog.update(blog_params)
                  params[:blog_images]['image'].each do |b|
                   @blog_image = @blog.blog_images.update(:image => b)
                  end
                format.html { redirect_to @blog, notice: 'Item was successfully created.' }
                    
                elsif params[:blog_photos]!=nil && params[:blog_images]==nil && @blog.update(blog_params)
                  params[:blog_photos]['photo'].each do |a|
                   @blog_photo = @blog.blog_photos.update(:photo => a)
                  end
                format.html { redirect_to @blog, notice: 'Item was successfully created.' }
                
                elsif @blog.update(blog_params)
                  params[:blog_photos]['photo'].each do |a|
                   @blog_photo = @blog.blog_photos.update(:photo => a)
                  end
                  params[:blog_images]['image'].each do |b|
                   @blog_image = @blog.blog_images.update(:image => b)
                  end
                format.html { redirect_to @blog, notice: 'Item was successfully created.' }
                
                else
                format.html { redirect_to @blog, notice: 'Item was not created.' }
                end
        end
        #↓うまくいってた複数画像編集basic_ver変更前↓
        #  respond_to do |format|
        #         if params[:blog_photos]==nil && params[:blog_images]==nil  && @blog.update(blog_params)
        #         format.html { redirect_to @blog, notice: 'Item was successfully created.' }
                
        #         elsif @blog.update(blog_params)
        #           params[:blog_photos]['photo'].each do |a|
        #           @blog_photo = @blog.blog_photos.update(:photo => a)
        #           end
        #           params[:blog_images]['image'].each do |b|
        #           @blog_image = @blog.blog_images.update(:image => b)
        #           end
        #         format.html { redirect_to @blog, notice: 'Item was successfully created.' }
                
        #         else
        #         format.html { redirect_to @blog, notice: 'Item was not created.' }
        #         end
        #     end
        
    end
    
    # def search
    #     @blogs = Blog.where('title LIKE(?)', "%#{params[:keyword]}%")
    # end
    
    def search
        # @blogs = Blog.order("created_at DESC").page(params[:page]).per(5)
        
        @blogs = Blog.where('title LIKE(?)', "%#{params[:keyword]}%") #←これいる？
        @q = Blog.published.search(search_params)
        params.require(:q).permit(:title_cont)   #:qオブジェクトを指定し、さらに:qオブジェクトの中に定義された:title_contキーを指定している
        @bloges = @q.result.includes(:emotions,:themes)
    end
    
    private
    def search_params
        params.require(:q).permit!
    end
    
    def blog_params
        params.require(:blog).permit(:user_name, :title, :text, :status, blog_photos_attributes: [:id, :blog_id, :photo], blog_images_attributes: [:id, :blog_id, :image], emotion_ids: [], theme_ids: []).merge(user_id: current_user.id)
    end
    
    def move_to_index
       redirect_to  '/' unless user_signed_in?
    end
end
