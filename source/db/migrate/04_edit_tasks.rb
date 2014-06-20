# NOTE : A task is a porttion of a goal (one-day's worth of the goal)

require_relative '../../config/application'

class EditTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :date_of_task
    add_column :tasks, :date_of_task, :datetime
  end
end
