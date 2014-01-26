require_relative "screen"
require_relative "actionScreen"

class TrainManipDataScreen < ActionScreen
  def initialize()
  end

  def query_action   
  end

  def completion_badge
    return "trainManipDataScreenBadge"
  end
end
