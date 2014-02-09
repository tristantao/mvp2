require_relative "screen"

class ToolsScreen < Screen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @description = "Welcome to the Tools Screen. There are tons of machine learning tools that can be applied to\nthis data project but we will teach two."
  end


  def visit_badge
    return "toolsScreenBadge"
  end
end
