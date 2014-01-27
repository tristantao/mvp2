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

    def query_action
        while true
            print "=" * 30
            puts "\nYou're current in the \"%s\", enter action \"action\" to do the action." % @name
            self.print_options
            raw_player_option = gets.chomp
            if raw_player_option == "back"
                return "last_screen"
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
        print "loading instructions."
        sleep (rand*1.5)
        print "."
        sleep (0.75)
        print "."
        sleep (0.75)
        print "complete!"
        sleep(rand*1.5)
        puts "\nRead and apply the following code to apply the appropriate function:"
        puts "+" * 25
        puts ""
        self.payload
        puts ""
        puts "+" * 25
    end

    def payload
        raise "ActionScreen must have a valid payload"
    end

    
end
