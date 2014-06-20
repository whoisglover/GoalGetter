# NOTE : A task is a porttion of a goal (one-day's worth of the goal)

require_relative '../../config/application'

class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |table|
      table.string :title
      table.datetime :date
      table.integer :hours
      table.boolean :completed
      table.references :goal
      table.timestamps
    end
  end
end
