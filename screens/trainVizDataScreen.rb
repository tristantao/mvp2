require_relative "screen"
require_relative "actionScreen"

class TrainVizDataScreen < ActionScreen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
  end

  def completion_badge
    return "trainVizDataScreenBadge"
  end

end
