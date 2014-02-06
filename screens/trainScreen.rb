require_relative "screen"

class TrainScreen < Screen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @description = "\nYou have the following options to work with the Train data:"
  end

  def completion_badge
    return "trainScreenBadge"
  end
end
