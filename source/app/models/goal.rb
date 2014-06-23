require_relative '../../config/application'

class Fixnum
  def days
    self * 86400
  end
end

class String
  def is_integer?
    self.to_i.to_s == self
  end
end

#-------------------------#
#-------------------------#

class Goal < ActiveRecord::Base
  has_many :tasks

  def self.add_goal
    new_goal = {}

    puts "OK, Let's Add a Goal"
    10.times do
      print "- "
      sleep(0.04)
    end
    goal_description(new_goal)
  end

  #-------------------------#

  def self.goal_description(new_goal)
    print "\nGoal Description: "
    title = gets.chomp
    new_goal[:title] = title
    goal_days(new_goal)
  end

  #-------------------------#

  def self.goal_days(new_goal)
    print "How many days do you have to work towards this goal? "
    days_to_work = gets.chomp
    if days_to_work.to_i == 0
      invalid_input_goals(days_to_work, new_goal)
    end
    days_to_work.is_integer? ? end_date_of_goal(days_to_work, new_goal) : invalid_input_goals(days_to_work, new_goal)
  end

  #-------------------------#

  def self.end_date_of_goal(days_to_work, new_goal)
    days_to_work = days_to_work.to_i
    end_date = Time.now + days_to_work.days
    new_goal[:end_date] = end_date
    hours_to_complete(new_goal)
  end

  #-------------------------#

  def self.invalid_input_goals(days_to_work, new_goal)
    print "#{days_to_work} is not a valid input. Please enter a number.\n \n"
    goal_days(new_goal)
  end

  #-------------------------#

  def self.hours_to_complete(new_goal)
    print "How many total hours do you expect you'll need to reach your goal? "
    hours_needed = gets.chomp
    hours_needed.is_integer? ? new_goal[:hours_needed] = hours_needed : invalid_input_hours(new_goal)
    View.availability(new_goal)
  end

  #-------------------------#

  def self.invalid_input_hours(new_goal)
    puts "Not a valid input. Please try again.\n \n"
    hours_to_complete(new_goal)
  end

  #-------------------------#

  def self.check_availability(days_available, new_goal)
    days_available = days_available.downcase
    if days_available == 'weekdays' || days_available == 'weekends' || days_available == 'both'
      vaild_input_availability(days_available, new_goal)
    else
      View.invalid_input_availability(new_goal)
    end
  end

  #-------------------------#

  def self.vaild_input_availability(days_available, new_goal)
    days_available = days_available.downcase
    case days_available

    when 'weekdays'
      new_goal[:weekday] = true
      new_goal[:weekend] = false
    when 'weekends'
      new_goal[:weekday] = false
      new_goal[:weekend] = true
    when 'both'
      new_goal[:weekday] = true
      new_goal[:weekend] = true
    end
    new_goal[:hours_completed]=0
    puts new_goal
  end
end
