class Task < ActiveRecord::Base

	belongs_to :project
 validates_presence_of :title 
 #validates_numericality_of :project_id


  #validate :check_valid_date
 #private

 #def check_valid_date
 	#if(self.due_date < self.project.start_date || self.due_date > self.project.end_date)
 		#errors.add(:due_date, "is invalid")
 	#end
 #end

end
