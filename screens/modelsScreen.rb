require_relative "screen"

class ModelScreen < Screen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
  end

  def query_action   
  end

  def completion_badge
    return "modelScreenBadge"
  end
end
