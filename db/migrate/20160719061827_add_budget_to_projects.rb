class AddBudgetToProjects < ActiveRecord::Migration
  def change

  	#add column :table_name, :column_name, :column_type
  	add_column :projects, :budget, :integer
  	#add_column :
  end
end
