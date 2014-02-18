require_relative "screen"

class ToolsScreen < Screen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @description = "Welcome to the Tools Screen. There are many models that can be applied to
this data project, but we will only go over two: generalized linear models (GLM) and Classification Trees (CT)."

	  @display_description = "Learn and apply Analytics tools here"
  end



  def visit_badge
    return "toolsScreenBadge"
  end
end
