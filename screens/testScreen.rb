require_relative "screen"

class TestScreen < Screen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @description = "You have the following options to work with the Test data:"
  end


  def visit_badge
    return "testScreenBadge"
  end
end
