class ProjectsController < ApplicationController

before_action :authenticate_user!
load_and_authorize_resource

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
		@project = Project.new
	end

	def create
		@project = Project.create(project_params)
		@project.user_id = current_user.id
		if @project.save
			redirect_to projects_path, notice: "Successfully created project"
		else
			render action: "new"
		end
	end
     
    def show
    	begin
		@project = current_user.projects.find(params[:id])
	    rescue ActiveRecord::RecordNotFound
	    	redirect_to projects_path, notice: "Record Not found"
	    end
	    @task = Task.new
	end
    def edit
    	@project = current_user.projects.find(params[:id])
    end
    def update
    	@project = Project.find(params[:id])
    	@project.user_id = current_user.id
    	if @project.update_attributes(project_params)
    		redirect_to project_path(@project.id), notice: "successfully updated"
    	else
    		render action: "edit"
    	end
    end

    def destroy
    	@project = current_user.projects.find(params[:id])
    	@project.destroy
    	redirect_to projects_path, notice: "successfully deleted"
    end


	private
	def project_params
		params[:project].permit(:client_id, :name, :description, :start_date, :end_date, :status, :estimated_budget, category_ids: [])
	end

	
end
