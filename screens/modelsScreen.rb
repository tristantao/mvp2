require_relative "screen"

class ModelsScreen < Screen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
  end

  def completion_badge
    return "modelsScreenBadge"
  end
end
