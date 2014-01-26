class Screen
#    attr_accessor :do

    def initialize(reachable_target)
    	if reachable_target.length == 0
    		raise "Can't instantiate a screen with no return!"
    	end
       	raise "Can't instantiate abstract class!"
    end

    def do
        raise "do() must be overwritten!"
    end 

    def completion_badge
    	raise "A screen must have a completion badge!"
    end
end 
