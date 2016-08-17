class AnnouncementsController < ApplicationController
	

   def index
		@announcements = current_user.announcements
		
   end
	def new
		@announcement = Announcement.new
	end

def create
		@announcement = Announcement.new(announcement_params)
		@announcement.user_id = current_user.id
	
		if @announcement.save
			Notify.announcement(@announcement).deliver!
			redirect_to announcements_path, notice: "successfully announced"
		else
			render action: "new"
        end
    end


   private
	def announcement_params
		params[:announcement].permit(:title, :body, :user_id)
	end
end