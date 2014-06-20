require 'debugger'
require 'pp'
require_relative '../views/view'

class Controller
  def self.run
    begin
    View.clear_screen
    View.welcome_message
    View.main_menu
    keep_going = true
    main_menu_input = View.user_input_digit #chagne to string
    #check if input is numeric, if so convert to i else leave
    case main_menu_input
      when 1
        new_goal = add_goal_sub_menu
        View.clear_screen
        # pp new_goal
        sleep(5)
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
      when 5
        #Grab completed goals (array format)
        completed_dummies = ['123456789012','beer','gin']
        View.completed_goals_screen(completed_dummies)
        View.clear_screen
      when 6
        View.goal_statistics_screen
      when 7
        #ascii art of brick
        View.exit_message
        keep_going = false
      when 'exit'
        View.exit_message
        keep_going = false
      else
        View.invalid_input(1..7)
        sleep(1)
    end
      # if main_menu_input == 7 or main_menu_input
    end while keep_going
  end

  def self.add_goal_sub_menu
    View.clear_screen
    new_goal = View.add_goal_screen
    new_goal
  end



end