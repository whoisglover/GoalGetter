class Input

  def self.check_input(input)
    if input == 'exit' || input.to_i == 7
      abort("Goodbye.")
    end
    if input.to_i.to_s == input && input.to_i.between?(1, 6)
      return true
    else
      false
    end
  end

  def self.valid_input(input)
    input = input.to_i
    case input
    when 1
      View.clear_screen
      Goal.add_goal
    end
  end


  # METHODS FOR INVALID INPUT

  #-------------------------#

  def self.invalid_input_menu(input)
    puts "#{input} is not a valid selection. Please enter a number 1 through 7."
    sleep(1.4)
    Controller.run
  end

  #-------------------------#

  def self.invalid_input_goals(days_to_work, new_goal)
    print "#{days_to_work} is not a valid input. Please enter a number.\n \n"
    Goal.goal_days(new_goal)
  end

  #-------------------------#

  def self.invalid_input_hours(new_goal)
    puts "Not a valid input. Please try again.\n \n"
    Goal.hours_to_complete(new_goal)
  end

  #-------------------------#

  def self.invalid_input_availability(new_goal)
    puts "Not a valid input. Please try again."
    View.availability(new_goal)
  end
end
