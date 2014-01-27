require_relative "screen"
require_relative "actionScreen"

class TrainViewDataScreen < ActionScreen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
  end

  def query_action
  end

  def completion_badge
    return "trainViewDataScreenBadge"
  end

  def payload()
    return "edit(trainData)"
  end
end
