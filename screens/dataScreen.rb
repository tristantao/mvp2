require_relative "screen"

class DataScreen < Screen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @description = "\nNotice that you are given two datasets! We will use the Train dataset to build our model and then make predictions for the observations in the Test dataset."
  end
  def visit_badge
    return "dataScreenBadge"
  end
end
