class ClientsController < ApplicationController
  
  before_action :authenticate_user!
  load_and_authorize_resource

	def index
		@clients = current_user.is_admin? ? Client.all : current_user.clients
	end

		#Client.where('user_id =?', current_user.id)
	#end
	def new
		@client = Client.new
	end


	def create
		@client =Client.create(client_params)#values which is used in form through the controller will passed as params wich is in hash
		@client.user_id = current_user.id
		if @client.save
			redirect_to clients_path
		else
			render action: "new"
		end
	end

	def show
		begin
		@client = current_user.clients.find(params[:id])#if i want to send data from browser to controller then it passed as params nd id here is primary key
	    rescue ActiveRecord::RecordNotFound
	    	 redirect_to clients_path, notice: "Record Not Found"
	    end
	end

	def edit
		@client = current_user.clients.find(params[:id])
	end

	def update
		@client = Client.find(params[:id])
		@client.user_id = current_user.id
		if @client.update_attributes(client_params)
			redirect_to client_path(@client.id), notice: "Successfully updated"
		else
			render action: "edit"
		end
	end

	def destroy
		@client = current_user.clients.find(params[:id])
dd		@client.destroy
		redirect_to clients_path, notice: "Successfully deleted" #"{@client.name}"
	end
		#goes to index path


	private
	def client_params
		params[:client].permit(:name, :company, :email, :mobile)
	end

	

end
 