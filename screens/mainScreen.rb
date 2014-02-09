require_relative "screen"

class MainScreen < Screen

  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @description = "This is the main screen of the tutorial!"
  end
  def visit_badge
    return "mainScreenBadge"
  end

end
