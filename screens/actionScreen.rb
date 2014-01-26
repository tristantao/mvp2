require_relative "screen"

class ActionScreen < Screen

    def initialize()
        super()
    end

    def do
        super()
    end

    def payload()
    	raise "ActionScreen must have a valid payload"
    end
end 
