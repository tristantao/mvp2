require_relative "screen"

class ToolsScreen < Screen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
  end


  def completion_badge
    return "toolsScreenBadge"
  end
end
