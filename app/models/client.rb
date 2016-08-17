class Client < ActiveRecord::Base
 
  has_many :projects
  has_many :announcements
  belongs_to :user

  before_create :generate_client_code
  before_destroy :destroy_projects

  validates_presence_of :name, :company, :mobile, :email
  validates_length_of :mobile, is: 10
  validates_numericality_of :mobile
  validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i


  validates_uniqueness_of :mobile, :email, scope: :user_id
  

	def details
		"#{self.name}<br/> - #{self.company}<br/> - #{self.mobile} - #{self.email}"
    end
	def list_projects
		Project.where('client_id = ?', self.id)
	end
    def list_by_status(status)
    	Project.where('client_id = ? AND status =?', self.id, status)
    end

    def generate_client_code
      self.code = "#{self.name[0..2]} - #{Client.last.nil? ? 1 : Client.last.id + 1}"
    end

    def destroy_projects
      self.projects.each do |project|
        project.destroy
    end
  end

end
