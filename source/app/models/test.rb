require_relative 'goal'


goal_info = { title: "Juggle",
  complete_goal_by: Date.today,
  hours_needed: 20,
  hours_completed: 0,
  weekday: false,
  weekend: true
}

Goal.make_a_goal(goal_info)
