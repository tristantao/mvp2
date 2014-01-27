require_relative "screen"
require_relative "actionScreen"

class TrainViewDataScreen < ActionScreen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
  end
  def do
    puts "You're now at the \"View Training Data\" screen!"
    super()
  end
  def completion_badge
    return "trainViewDataScreenBadge"
  end

  def payload()
    puts "Here, you learn how to inspect the data. In R,  we utilize the following function to achieve that goal:"
    puts "edit(trainData) \n"
  end
end
