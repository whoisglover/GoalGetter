
require_relative '../models/task'
require_relative '../models/goal'
require_relative '../models/input'
require_relative '../views/view'


class Controller
  def self.run
    View.clear_screen
    View.welcome_message
    View.main_menu
    user_input = View.get_input
    Input.check_input(user_input) ? Input.valid_input(user_input) : Input.invalid_input_menu(user_input)
  end
end
