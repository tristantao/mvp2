require_relative "screen"

class DataScreen < Screen
  def initialize(reachable_target)
    super(reachable_target) 
  end

  def query_action   
  end

  def completion_badge
    return "dataScreenBadge"
  end
end
