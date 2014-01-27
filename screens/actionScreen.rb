require_relative "screen"

class ActionScreen < Screen

	@action_methods = nil
    def initialize(reachable_target, name, points)
        super(reachable_target, name, points)
        @action_methods = Set.new
    end

    def do #Here, 
        super()
    end

    def payload
    	raise "ActionScreen must have a valid payload"
    end

    def completion_badge
    	return "actionScreenBadge"
    end
    
end
