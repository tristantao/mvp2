require_relative "screen"

class MainScreen < Screen

  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
  end

  def completion_badge
    return "mainScreenBadge"
  end

end
