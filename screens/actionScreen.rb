require_relative "screen"

class ActionScreen < Screen

	@action_methods = nil
    def initialize(reachable_target, name, points)
        super(reachable_target, name, points)
        @action_methods = Set.new
    end

    def do
        puts "\nRead and apply the following code to apply the appropriate function:"
        puts "+" * 25
        puts ""
        self.payload
        puts ""
        puts "+" * 25
    end

    def payload
    	raise "ActionScreen must have a valid payload"
    end

    def completion_badge
    	return "actionScreenBadge"
    end

    def query_action
        
    end
    
end
