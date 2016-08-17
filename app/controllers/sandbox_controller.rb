class SandboxController < ApplicationController
  def clients
  	@clients =Client.all
  	#@client = Client.find(2) #deal wid single obj so @client
  	#@client_by_id = Client.find(1,3)
  end

  def projects
  	@projects = Project.all
  	#@projects = Project.where('client_id = ?', 10)
  	 #@projects = Project.where('start_date > ?', Date.today - 1.month)
  	 # @projects = Project.order('start_date') #ascending order
  	 #@projects = Project.order('start_date DESC') #descending order
  	 #@projects = Project.order('start_date DESC').limit(5)
  	 #@projects = Project.order('name')
end

  def tasks
    @tasks = Task.all
    @completed_tasks = Task.where('is_completed =?', true)
    @incompleted_tasks = Task.where('is_completed =? AND due_date >= ?', false, Date.today)
    @over_due_tasks = Task.where('due_date < ? AND is_completed = ?', Date.today, false)
  end



  def job_results
    technology = params[:technology]
    location = params[:location]
   response = HTTParty.get("http://api.indeed.com/ads/apisearch?publisher=7277146494571922&q=#{technology}&co=india&l=#{location}&format=json&v=2")
   @job_results = response.parsed_response
    end
  end