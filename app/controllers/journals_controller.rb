class JournalsController < ApplicationController
    
    def new
    end
    
    def show
        @journal = Journal.find(params[:id])
    end
    
    def create
        Journal.create(user_name: journal_params[:user_name], title: journal_params[:title], text: journal_params[:text], user_id: current_user.id)
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
        journal = Journal.find(params[:id])
        if journal.user_id == current_user.id
            journal.update(journal_params)
        end
    end
    
    private
    def journal_params
        params.permit(:user_name, :title, :text)
    end
end
