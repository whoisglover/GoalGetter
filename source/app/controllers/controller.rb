# require 'debugger'
# require 'pp'
require_relative '../views/view'

class Controller
  def self.run
    begin
    View.clear_screen
    View.welcome_message
    View.main_menu
    main_menu_input = View.user_input_digit
    case main_menu_input
      when 1
        new_goal = add_goal_sub_menu
        # pp new_goal
        # Goal.create_a_goal(new_goal)
        View.add_success_message
      when 2
        #todays_tasks =Tasks.where("date = ?", today)
        todays_dummies = ['hike', 'climb', 'swim']
        completed = View.todays_tasks_screen(todays_dummies)        
        #completed is an array of tasks numbers to be set to complete
        #update tasks
      when 3
         #todays_tasks =Tasks.where("date = ?", today)
        todays_dummies = ['hike', 'climb', 'swim']
        completed = View.todays_tasks_screen(todays_dummies)        
        #completed is an array of tasks numbers to be set to complete
        #update tasks
      when 4
        #Grab goals that are not complete (array format)
        #Goals.where("completed = ?", false)
        not_complete_dummies = ['hike', 'climb', 'live']
        View.outstanding_goals_screen(not_complete_dummies)
        sleep(0.5)
      when 5
        View.clear_screen
        puts 'valid'
        sleep(0.5)
      when 6
        View.clear_screen
        puts 'valid'
        sleep(0.5)
      when 7
        View.exit_message
      else
        View.invalid_input(1..7)
        sleep(1)
    end
    end while main_menu_input != 7
  end

  def self.add_goal_sub_menu
    View.clear_screen
    new_goal = View.add_goal_screen
    new_goal
  end



end