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
end
