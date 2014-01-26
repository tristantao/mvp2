require_relative "screen"

class ActionScreen < Screen

    def initialize(reachable_target)
        super(reachable_target)
    end

    def do
        super()
    end

    def payload()
    	raise "ActionScreen must have a valid payload"
    end
end 
