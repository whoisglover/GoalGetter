
require_relative '../models/task'
require_relative '../models/goal'
require_relative '../views/view'

require 'active_record'
require 'sqlite3'
require 'debugger'
require 'pp'
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
        View.clear_screen
        puts 'valid'
        sleep(0.5)
      when 3
        View.clear_screen
        puts 'valid'
        sleep(0.5)
      when 4
        View.clear_screen
        puts 'valid'
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
