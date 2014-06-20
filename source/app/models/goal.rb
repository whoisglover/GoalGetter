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

      valid_dates.each do |date|
        p Task.create(date_of_task: date, title: title)
      end


    end

    def self.find_available_dates(goal_id)
      today = Time.now + days(1)
      # end_date = Time.now + THIS SHOULD BE TAKEN IN FROM GOAL
      end_date = Time.now + days(5)

      title = Goal.find(goal_id).title
      valid_dates = []
      while(today <= end_date)
        if day_valid?(goal_id, today)
          valid_dates << today
        end
        today += days(1)
      end
      return  valid_dates
    end

    def self.day_valid?(goal_id, date)
      if date.wday > 0 && date.wday < 6
        # return Goal.find(goal_id).weekday
      end

        # return Goal.find(goal_id).weekend
        return true
    end




    def self.days(days)
      return days * 24 * 60 * 60
    end



    def num_completed_tasks(tasks)
      count = 0
      tasks.each do |task|
        count += 1 if task.completed
      end

    end
end





# #TEST CODE

# goal_info = { title: "Play violin",
#   complete_goal_by: Date.today,
#   hours_needed: 20,
#   hours_completed: 0
# }

# Goal.make_a_goal(goal_info)