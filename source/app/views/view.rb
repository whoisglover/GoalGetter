
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


  def self.availability(new_goal)
    puts "\nWhen are you available to work on this goal? "
    puts "\n-Weekdays"
    puts "-Weekends"
    puts "-Both"
    puts "\n Please enter your selection: "
    days_available = gets.chomp
    days_available = days_available.downcase
    Goal.check_availability(days_available, new_goal)
  end
end
