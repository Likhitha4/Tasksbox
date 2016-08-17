class Project < ActiveRecord::Base

  #has_many :join_table
  #has_many :associated_table, through: :join_table

  has_many :project_categories
  has_many :categories, through: :project_categories

	belongs_to :client
    has_many :tasks
    belongs_to :user

  before_destroy :destroy_all_tasks
  before_create :generate_project_code
  

   validates_presence_of :name, :description, :start_date, :end_date, :client_id, :estimated_budget, :status
   validates_length_of :description, minimum:10 
   validates_numericality_of :client_id, scope: :user_id


   #customer validations
   #validate :check_date

	#def self.new_projects
		#Project.where('status =?', new)
	#end

  def completed_tasks
      self.tasks.where('is_completed =?', is_completed = true)
    end

    def incompleted_tasks
      self.tasks.where('is_completed=?', is_completed = false)
    end


	private

  def generate_project_code
      self.code = "#{self.name[0..2]} - #{Project.last.nil? ? 1 : Project.last.id + 1}"
    end


  def destroy_all_tasks
      self.tasks.each do |task|
        task.destroy 
      end
    end

	def check_date
        if(!self.end_date.nil? &&  !self.start_date.nil?) && (self.end_date <= self.start_date)
        errors.add(:end_date, "should be greater than start date")
        end
        end

            
	def list_tasks
		Task.where('project_id = ?', self.id)
	end
	def list_by_status(status)
    	Project.where('project_id = ? AND status =?', self.id, status)
    end

end
