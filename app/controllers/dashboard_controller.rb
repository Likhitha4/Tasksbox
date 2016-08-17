class DashboardController < ApplicationController

	def index
		@clients = current_user.is_admin? ? Client.all : current_user.clients
	end

	
	def index
		if params[:status]
			@projects = current_user.projects.where('status =?', params[:status])
		elsif params[:client_id]
			@projects = current_user.clients.where('client_id = ?', params[:client_id])
         else
		@projects = current_user.is_admin? ? Project.all : current_user.projects
	end
	end

	def new
		@client = Client.new
	end

end
