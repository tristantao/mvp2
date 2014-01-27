require_relative "screen"

class DataScreen < Screen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points) 
  end

  def query_action
  end

  def completion_badge
    return "dataScreenBadge"
  end
end
