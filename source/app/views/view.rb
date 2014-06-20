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
    end while !is_numeric?(hours_needed)
    new_goal[:hours_needed] = hours_needed
    print "Avalability: "
    availability = user_input_string
    new_goal[:availability] = availability
    new_goal
  end

  def self.todays_tasks_screen(tasks)
    View.clear_screen
    tasks_completed = []
    puts "Tasks to complete today"
    puts "------------------------"
    tasks.each_with_index do |task,index|
      puts "#{index+1}. Work on #{task} for X hours."
    end
    begin
      print "Task Completed (or exit): "
      user_input = user_input_string
      if is_numeric?(user_input) and user_input.to_i <= tasks.length
        tasks_completed << user_input.to_i
      else
        puts invalid_input(1..tasks.length)
      end
    end while user_input != 'exit'
    tasks_completed
  end

  def self.outstanding_goals_screen(goals)
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
      # print "%-20d" % dummy_date
    end
    sleep(5)
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
  end
  
  def self.is_numeric?(obj) 
   obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end
  




end