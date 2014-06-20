# NOTE : A task is a porttion of a goal (one-day's worth of the goal)

require_relative '../../config/application'

class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |table|
      table.string :title
      table.string :complete_goal_by
      table.string :hours_needed
      table.string :hours_completed
      table.string :availability
    end
  end
end