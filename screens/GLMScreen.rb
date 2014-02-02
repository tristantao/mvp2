require_relative "screen"
require_relative "actionScreen"

class GLMScreen < ActionScreen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @payload_hash = Hash.new
  end

  def completion_badge
    return "GLMScreenBadge"
  end

  def completion_action_badge
  	return "GLMActionBadge"
  end

end
