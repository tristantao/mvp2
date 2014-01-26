#This class is intended as the abstract class that all screens (including actionScreen) will inherit.
require 'set'

class Screen
    attr_accessor :reachable_target
	@reachable_target = nil

    def initialize(reachable_target)
        @reachable_target = Set.new(reachable_target)
    end

    def do
        raise "Screen.do() must be overwritten!"
    end

    def add_reachable_target (target)
        if @reachable_target == nil
            raise "@reachable_target is empty"
        else
            if not target.options.include? self
                target.add_reachable_target(self)
            end
            @reachable_target << target
        end
    end

    def options
    	if @reachable_target == nil
	    	raise ArgumentError, "Reachable_target is nil!"
		else
            return @reachable_target
        end
	end
    def completion_badge
    	raise "A screen must have a completion badge!"
    end
end 
