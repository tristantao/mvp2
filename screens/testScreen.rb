require_relative "screen"

class TestScreen < Screen
  def initialize(reachable_target)
    super(reachable_target)
  end

  def query_action
  end

  def completion_badge
    return "testScreenBadge"
  end
end
