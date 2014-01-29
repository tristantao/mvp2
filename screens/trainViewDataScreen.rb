require_relative "screen"
require_relative "actionScreen"

class TrainViewDataScreen < ActionScreen

  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @payload_list = ["Here, you learn how to inspect the data. In R,  we utilize the following function to achieve that goal:",
    "edit(trainData)"
    ]
  end

  def completion_badge
    return "trainViewDataScreenBadge"
  end

end
