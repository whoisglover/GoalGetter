# NOTE : A task is a porttion of a goal (one-day's worth of the goal)

require_relative '../../config/application'

class EditGoals < ActiveRecord::Migration
  def change
    add_column :goals, :weekend, :boolean
    add_column :goals, :weekday, :boolean
    remove_column :goals, :complete_goal_by
    add_column 	:goals, :complete_goal_by, :datetime
    remove_column :goals, :hours_needed
    add_column :goals, :hours_needed, :integer
    remove_column :goals, :hour_completed
    add_column :goals, :hour_completed, :integer
  end
end
