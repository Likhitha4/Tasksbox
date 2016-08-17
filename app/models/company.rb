class Company < ActiveRecord::Base

	has_many :employees
	validates :name, :company, :email, presence: true
end
