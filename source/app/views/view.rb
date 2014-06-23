
class View

  def self.clear_screen
    puts "\e[H\e[2J"
  end

  def self.welcome_message
    puts "Welcome to Goal Getter"
    puts "-----------------------"
    puts "What Would You Like to Do?"
    puts
  end

  def self.main_menu
    puts "1. Add a New Goal"
    puts "2. View Today's Tasks"
    puts "3. Record Goal Progress"
    puts "4. See Outstanding Goals"
    puts "5. See Completed Goals"
    puts "6. Goal Statistics"
    puts "7. Exit"
    puts
    print "Selection: "
  end

  def self.get_input
    gets.chomp
  end

  def self.invalid_input(input)
    puts "#{input} is not a valid selection. Please enter a number 1 through 7."
    sleep(1.4)
    Controller.run
  end

  def self.availability(new_goal)
    puts "When are you available to work on this goal? "
    puts "-Weekdays"
    puts "-Weekends"
    puts "-Both"
    puts "\n Please enter your selection: "
    days_available = gets.chomp
    days_available = days_available.downcase
    Goal.check_availability(days_available, new_goal)
  end

  def self.invalid_input_availability(new_goal)
    puts "Not a valid input. Please try again."
    availability(new_goal)
  end
end
