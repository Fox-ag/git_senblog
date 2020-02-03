class JournalsController < ApplicationController
    
    def new
        @journal = Journal.new
        @journal_photo = @journal.journal_photos.build
    end
    
    def show
        @journal = Journal.find(params[:id])
        @journal_photos = @journal.journal_photos.all
    end
    
    def create
        @journal = Journal.new(journal_params) 
        
        
            respond_to do |format|
                if params[:journal_photos]==nil && @journal.save
                format.html { redirect_to @journal, notice: 'Item was successfully created.' }
                
                elsif @journal.save
                  params[:journal_photos]['photo'].each do |a|
                   @journal_photo = @journal.journal_photos.create!(:photo => a)
                  end
                format.html { redirect_to @journal, notice: 'Item was successfully created.' }
                
                else
                format.html { redirect_to @journal, notice: 'Item was not created.' }
                end
            end
    end
    
    def destroy
       journal = Journal.find(params[:id])
       if journal.user_id == current_user.id
           journal.destroy
       end
    end
    
    def edit
        @journal = Journal.find(params[:id])
    end
    
    def update
        # journal = Journal.find(params[:id])
        # if journal.user_id == current_user.id
        #     journal.update(journal_params)
        # end
        
        @journal = Journal.find(params[:id])
        respond_to do |format|
                if params[:journal_photos]==nil && @journal.update(journal_params)
                format.html { redirect_to @journal, notice: 'Item was successfully created.' }
                
                elsif @journal.update(journal_params)
                  params[:journal_photos]['photo'].each do |a|
                   @journal_photo = @journal.journal_photos.create!(:photo => a)
                  end
                format.html { redirect_to @blog, notice: 'Item was successfully created.' }
                
                else
                format.html { redirect_to @blog, notice: 'Item was not created.' }
                end
            end
        
    end
    
    private
    def journal_params
        params.require(:journal).permit(:user_name, :title, :text, journal_photos_attributes: [:id, :journal_id, :photo], emotion_ids: []).merge(user_id: current_user.id)
    end
end
