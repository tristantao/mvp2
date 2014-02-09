require_relative "screen"

class TestScreen < Screen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @description = "This is the place where you work with testing data. You can view,
vizualize, and eventually modify the data."
		@display_description = "Work with the testing data."

  end


  def visit_badge
    return "testScreenBadge"
  end
end
