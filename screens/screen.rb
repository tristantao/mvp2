#This class is intended as the abstract class that all screens (including actionScreen) will inherit.

class Screen
	@reachable_target = nil

    def initialize(reachable_target)
    	if reachable_target.length == 0
    		raise "Can't instantiate a screen with no return!"
    	end
       	raise "Can't instantiate abstract class!"
    end

    def do
        raise "Screen.do() must be overwritten!"
    end 

    def options
    	if @reachable_target == nil
	    	raise "No reachable_target!"
		end	
	end
    def completion_badge
    	raise "A screen must have a completion badge!"
    end
end 
