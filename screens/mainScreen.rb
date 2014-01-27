require_relative "screen"

class MainScreen < Screen

  def initialize(reachable_target)
    super(reachable_target)
  end

  def query_action
  end

  def completion_badge
    return "mainScreenBadge"
  end

end
