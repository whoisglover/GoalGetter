require 'debugger'
require_relative '../../config/application'

class Goal < ActiveRecord::Base
  has_many :tasks
    # def self.create_a_goal(goal_info = {})

    # end

    def self.make_a_goal(goal_info = {})
      new_goal = Goal.create(goal_info)
      p "added goal with id: #{new_goal.id}"
      create_tasks_for_goal(new_goal.id)
    end

    def self.create_tasks_for_goal(goal_id)
      # How many tasks to create?
      # Weekday or weekend
      valid_dates = find_available_dates(goal_id)
      title = Goal.find(goal_id).title
      hours = hours_per_task(valid_dates.length, Goal.find(goal_id).hours_needed)

      valid_dates.each do |date|
        Task.create(date: date, title: title, completed: false, hours: hours, goal_id: goal_id)
      end
    end

    def self.hours_per_task(num_tasks, total_hours)
      return (total_hours / num_tasks) + 1
    end

    def self.find_available_dates(goal_id)
      today = Time.now
      end_date = Goal.find(goal_id).end_date

      title = Goal.find(goal_id).title
      valid_dates = []
      while(today <= end_date)
        if day_valid?(goal_id, today)
          valid_dates << today
          # puts "found valid day"
        end
        today += days(1)
        # puts "today: #{today}, end_date: #{end_date}"
      end
      return  valid_dates
    end



    def self.day_valid?(goal_id, date)
      # puts "in valid?"
      if date.wday > 0 && date.wday < 6
        return Goal.find(goal_id).weekday
      end

        return Goal.find(goal_id).weekend
    end




    def self.days(days)
      return days * 24 * 60 * 60
    end



    def self.num_completed_tasks(tasks)
      count = 0
      tasks.each do |task|
        count += 1 if task.completed
      end
    end
    def self.not_completed_goals
    goals = []
    Goal.all.each do |goal|
      goals << goal if (goal.hours_completed < goal.hours_needed)
    end
    goals
  end


end





# #TEST CODE

# goal_info = { title: "Play violin",
#   complete_goal_by: Date.today,
#   hours_needed: 20,
#   hours_completed: 0
# }

# Goal.make_a_goal(goal_info)