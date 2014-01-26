require_relative "screen"
require_relative "actionScreen"

class TrainVizDataScreen < ActionScreen
  def initialize()
  end

  def query_action   
  end

  def completion_badge
    return "trainVizDataScreenBadge"
  end
end
