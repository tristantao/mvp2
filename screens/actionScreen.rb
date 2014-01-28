require_relative "screen"

class ActionScreen < Screen

	@action_methods = nil
    def initialize(reachable_target, name, points)
        super(reachable_target, name, points)
        @action_methods = Set.new
    end

    def enter_screen_action
        super()
    end

    def completion_badge
    	return "actionScreenBadge"
    end

    def query_action (player)
        while true
            print_double_break
            puts "\nYou're current in the \"%s\", enter action \"action\" to do the action." % @name
            self.print_options
            raw_player_option = gets.chomp
            raw_player_option.strip!
            #byebug
            if player.KEY_TO_SCREEN.key? raw_player_option #If a special screen jump
                return raw_player_option
            elsif raw_player_option == "action"
                self.deliver_payload
                return self
            elsif raw_player_option == "XXX"
                abort ("XXX operation")
            else
                notify("Please enter a valid option!")
                next  
                end           
          end
        return self
    end

    def print_options
        puts "You can always enter \"back\" to return to last screen!"
        puts ""
    end

    def deliver_payload
        print "loading instructions.".red
        sleep (rand*1.5)
        print ".".yellow
        sleep (rand/3)
        print ".".yellow
        sleep (rand/3)
        print ".".yellow
        sleep (rand/2)
        print ".".yellow
        sleep (rand/2)
        print ".".yellow
        sleep (0.75)
        print "complete!".green
        sleep(rand*1.5)
        puts "\nRead and apply the following code to apply the appropriate function:"
        sleep(rand*1.5)
        print_plus_break
        print "\n\n"
        self.payload
        print "\n"
        print_plus_break
        puts "\nPress Enter when Done:"
        gets.chomp
    end

    def payload
        raise "ActionScreen must have a valid payload"
    end

    
end
