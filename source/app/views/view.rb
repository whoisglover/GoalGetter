
require 'active_record'
require 'sqlite3'


class View
  def self.clear_screen
    puts "\e[H\e[2J"
  end

  def self.user_input_digit
    num = $stdin.gets.chomp
    # debugger
    if num.to_i.to_s == num
      return num.to_i
    else
      puts "Not a number. Try again."
      return false
    end
  end

  def self.user_input_string
    $stdin.gets.chomp
  end

  def self.welcome_message
    puts "Welcome to Goal Getter"
    puts "-----------------------"
  end

  def self.main_menu
    puts "1. Add a new Goal"
    puts "2. View today's tasks"
    puts "3. Record Goal progress"
    puts "4. See all outstanding Goals"
    puts "5. See recently completed goals"
    puts "6. Goal statistics"
    puts "7. Exit"
  end

  def self.add_goal_screen
    new_goal = {}
    puts "Add a Goal"
    puts "------------"
    print "Goal Description: "
    title = user_input_string
    new_goal[:title] = title
    print "Complete this goal by: "
    due_date = user_input_string
    new_goal[:complete_goal_by] = due_date
    begin
      print "Total hours needed to complete #{title}: "
      hours_needed = user_input_digit
    end while !hours_needed.is_a? Integer
    new_goal[:hours_needed] = hours_needed
    print "Avalability: "
    availability = user_input_string
    new_goal[:availability] = availability
    new_goal
  end

  def self.add_success_message
    clear_screen
    puts "Successfully added a new goal."
    sleep(1.5)
  end

  def self.exit_message
    clear_screen
    puts "Good luck out there!"
    sleep(0.8)
  end
  def self.invalid_input(input_range)
    puts "Invalid Choice. Please enter #{input_range}"
  end
end
