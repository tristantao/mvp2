require_relative "screen"

class TrainScreen < Screen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @description = "This is the place where you work with training data. You can view,
vizualize, and eventually modify the data."
	@display_description = "Work with the training data."
	end

  def visit_badge
    return "trainScreenBadge"
  end
end
