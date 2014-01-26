require_relative "screen"

class ActionScreen < Screen

    def initialize(reachable_target, name, points)
        super(reachable_target, name, points)
    end

    def do
        super()
    end

    def payload()
    	raise "ActionScreen must have a valid payload"
    end
end 
