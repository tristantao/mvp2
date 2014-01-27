require_relative "screen"

class TrainScreen < Screen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
  end

  def completion_badge
    return "trainScreenBadge"
  end
end
