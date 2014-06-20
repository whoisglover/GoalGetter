
class View
  def self.clear_screen
    puts "\e[H\e[2J"
  end

  def self.user_input_digit
    num = $stdin.gets.chomp
    # debugger
    if num.to_i.to_s == num
      return num.to_i
    # elsif num.to_f.to_s == num  #Accept floats
      # return num.to_f
    elsif num =='exit'
      return num
    else
      puts "Not a whole number. Try again."
      return false
    end
  end

  def self.user_input_string
    $stdin.gets.chomp
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
  end

  def self.add_goal_screen
    new_goal = {}
    puts "Add a Goal"
    puts "------------"
    #current max title length is 12 characters, adjust screens to allow longer, discuss with team
    print "Goal Description: "
    title = user_input_string
    new_goal[:title] = title
    print "Work on this goal for how many days? "
    due_date = user_input_string
    new_goal[:complete_goal_by] = due_date
    begin
      print "Total hours needed to complete #{title}: "
      hours_needed = user_input_digit
    end while !is_numeric?(hours_needed)
    new_goal[:hours_needed] = hours_needed
    begin
      puts "Avalability: "
      puts "-Weekdays"
      puts "-Weekends"
      puts "-Both"
      selection_message
      availability = user_input_string
    end until availability.downcase == 'weekdays' || availability.downcase == 'weekends' || availability.downcase =='both'
    case availability.downcase
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
    new_goal
  end

  def self.todays_tasks_screen(tasks)
    begin
    View.clear_screen
    tasks_completed = []
    puts "Tasks to complete today"
    puts "------------------------"
    tasks.each_with_index do |task,index|
      puts "#{index+1}. Work on #{task} for X hours."
    end

      print "Task Completed (or exit): "
      user_input = user_input_string
      if is_numeric?(user_input) and user_input.to_i <= tasks.length
        tasks_completed << user_input.to_i
      elsif user_input == 'exit'
        #donothing
      else
        puts invalid_input(1..tasks.length)
      end
    end while user_input.downcase != 'exit'
    tasks_completed
  end

  def self.outstanding_goals_screen(goals)
    begin
      clear_screen
      dummy_date = '2014-06-20'
      dummy_percentage = '20%'
      puts "Goals Not Yet Completed"
      puts "------------------------"
      #stretch goal = align these damn tables
      puts "Goals          Completion Date     Percentage Completed"
      goals.each_with_index do |goal, index|
        print "#{index+1}. "
        print goal #.ljust(0)
        padding = 22-goal.length
        print dummy_date.rjust(padding)
        print dummy_percentage.rjust(13)
        puts ""
      end
      print "Type exit to return to main menu: "
      user_input = user_input_string
    end while user_input.downcase !='exit'
  end

  def self.completed_goals_screen(goals)
    begin
      clear_screen
      dummy_date = '2012-06-20'
      dummy_percentage = '100%'
      puts "YOU DID IT Completed Goals:"
      puts "--------------------------------------------- "
      puts "Goals          Completion Date    Percentage Completed"
      goals.each_with_index do |goal, index|
        print "#{index+1}."
        print goal
        padding = 23-goal.length
        print dummy_date.rjust(padding)
        print dummy_percentage.rjust(13)
        puts ""
      end
      print "Type exit to return to main menu: "
      user_input = user_input_string
    end while user_input.downcase !='exit'
  end

  def self.goal_statistics_screen
    begin
      View.clear_screen
      puts "Your Stats Page"
      puts "-------------------------"
      puts "Goals Outstanding: 3"
      puts "Goals Completed: 10"
      puts "Daily Task Completion Rate: 87%"
      puts "Goal Completion Rate: 75%"
      puts "Batting Average: .432"
      puts "Level: Goal Jedi"
      print "Type exit to return to main menu: "
      user_input = user_input_string
    end while user_input.downcase !='exit'
  end

  def self.add_success_message
    clear_screen
    puts "Successfully added a new goal."
    sleep(1.5)
  end

  def self.exit_message
    clear_screen
    puts "Good luck out there!"
    sleep(0.1)
  end
  def self.invalid_input(input_range)
    puts "Invalid Choice. Please enter #{input_range}"
    sleep(1.2)
  end

  def self.is_a_number?(input)
    if input.to_i.to_s == input
      return true
    elsif input.to_f.to_s == input  #Accept floats
      return true
    else
      return false
    end
  end

  def self.selection_message
    print "Selection: "
  end

  def self.is_numeric?(obj)
   obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end
end
