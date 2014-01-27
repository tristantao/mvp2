#This class is intended as the abstract class that all screens (including actionScreen) will inherit.
require 'set'

class Screen
    attr_accessor :name

	@reachable_target = nil
    @name = "Screen"
    @points = 0

    def initialize(reachable_target, name, points)
        @reachable_target = Set.new(reachable_target)
        @name = name
        @points = points
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

    def query_action 
        while true
            puts "You're current in the %s screen, and here are your options" % @name
        end
        return nil
    end 

    def print_acions

    end

    def completion_badge
    	raise "A screen must have a completion badge!"
    end
end
