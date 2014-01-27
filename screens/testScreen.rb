require_relative "screen"

class TestScreen < Screen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
  end

  def query_action
  end

  def completion_badge
    return "testScreenBadge"
  end
end
