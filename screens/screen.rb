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
        #Queries player for where the next screen is
        #@returns the index of the reachable_target that the player wants to go next
      while true
        print "=" * 30
        puts "\nYou're current in the \"%s\", and here are your options, please shoose the desired index" % @name
        self.print_options
        begin
          raw_player_option = gets.chomp
          player_choice = Integer(raw_player_option)
        rescue ArgumentError => e
          puts "Options be in integers, please re-enter!"
          next
        end
        if player_choice >= 0 and player_choice < @reachable_target.length
          break
        else
          puts "Option must be one of the shown indexes! "
        end
      end
      return player_choice
    end 
    
    def print_options
        self.options.each_with_index {|val, index| puts "#{index} => %s " % val.name }
    end

    def completion_badge
    	raise "A screen must have a completion badge!"
    end
end
