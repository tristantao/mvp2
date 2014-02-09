require_relative "screen"

class DataScreen < Screen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @description = "Notice that you are given two datasets [Train/Test]! We will disect and vizualize data,
and eventually clean them. \n
In general Data Scientists build models using cleaned Training data and then make predictions utilizing cleaned Test data."
	@display_description = "Work with the data"
  end
  def visit_badge
    return "dataScreenBadge"
  end
end
