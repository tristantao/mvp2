require_relative "screen"
require_relative "actionScreen"

class TrainManipDataScreen < ActionScreen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
  end

  def query_action
  end

  def completion_badge
    return "trainManipDataScreenBadge"
  end

  def payload
      return "manipluate this biatchhh!"
  end
end
