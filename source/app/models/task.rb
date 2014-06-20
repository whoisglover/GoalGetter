require 'active_record'
require 'sqlite3'

class Task < ActiveRecord::Base
  belongs_to :goal


  def self.complete(task_id)
    my_task = Task.find(task_id)
    my_task.completed = true
    my_task.save
    my_goal = Goal.find(my_task.goal_id)
    my_goal.hours_completed += my_task.hours
    my_goal.save
  end

  def self.todays_tasks
    day = Time.now.day
    month = Time.now.month
    year = Time.now.year

    todays_tasks = []

    Tasks.all.each do |task|
      date = task.date
      if (date.day == day && date.year == year && date.month == month)
        todays_tasks << task
      end

      return todays_tasks
    end


  end
end

