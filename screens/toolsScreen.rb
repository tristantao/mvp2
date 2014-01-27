require_relative "screen"

class ToolsScreen < Screen
  def initialize(reachable_target)
    super(reachable_target)
  end

  def query_action
  end

  def completion_badge
    return "toolsScreenBadge"
  end
end
