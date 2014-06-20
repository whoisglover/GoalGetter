# NOTE : A task is a porttion of a goal (one-day's worth of the goal)

require_relative '../../config/application'

class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |table|
      table.string :title
      table.integer :hours_needed
      table.integer :hours_completed
      table.boolean :weekday
      table.boolean :weekend
      table.datetime :datetime
    end
  end
end
