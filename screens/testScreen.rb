require_relative "screen"

class TestScreen < Screen
  def initialize()
  end

  def query_action   
  end

  def completion_badge
    return "testScreenBadge"
  end
end
