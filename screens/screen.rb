#This class is intended as the abstract class that all screens (including actionScreen) will inherit.
require 'set'
require 'colorize'

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

    def enter_screen_action
        #The Do() function for most screens will involve printing an explanation/intro to each screen.
        #This function is overwritten for actionScreens, which will also drop payloads
        #raise "Screen.do() must be overwritten!"
        print "\n>>>>>>%s<<<<<<\n".green % self.name
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

    def query_action (player)
        #Queries player for where the next screen is
        #@returns the index of the reachable_target that the player wants to go next
      while true
        print_double_break
        puts "\nYou're current in the \"%s\", and here are your options, please choose the desired index" % @name
        self.print_options
        begin
          raw_player_option = gets.chomp.strip
          raw_player_option.strip!
          #byebug
          if player.KEY_TO_SCREEN.key? raw_player_option #If a special screen jump
            return raw_player_option
          end
          player_choice = Integer(raw_player_option)
        rescue ArgumentError => e
          notify "Option must be in integers, please re-enter!"
          next
        end
        if player_choice >= 0 and player_choice < @reachable_target.length
          break
        else
          notify "Option must be one of the shown indexes/commands! "
        end
      end
      temp_array = @reachable_target.to_a
      return  temp_array[player_choice]
    end

    def print_options
        print_single_break
        print "\n"
        puts "back => Go back one screen"
        puts "main => Go back to main screen"
        self.options.each_with_index {|val, index| puts "#{index} => %s " % val.name }
        print "Your Input: ".magenta
    end

    def notify(msg)
        print "\n=> INFO: %s\n".red % msg
    end

    def print_double_break
        print "=".yellow * 30
    end
    def print_single_break
        print "-".yellow * 30
    end
    def print_plus_break
        print "+".yellow * 25
    end

    def completion_badge
    	raise "A screen must have a completion badge!"
    end
end
