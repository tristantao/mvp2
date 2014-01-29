require_relative "screen"
require 'ostruct'
class ActionScreen < Screen

	@action_methods = nil
    @payload_hash = {}
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
            puts "\nYou're current in the \"%s\", Choose You're options from below" % @name
            self.print_options
            raw_player_option = gets.chomp
            raw_player_option.strip!
            #byebug
            if player.KEY_TO_SCREEN.key? raw_player_option #If a special screen jump
                return raw_player_option
            elsif @payload_hash.key?(raw_player_option)
                self.deliver_payload(raw_player_option)
                return self
            else
                notify("Please enter a valid option!")
                next  
            end
          end
        return self
    end

    def print_options
        print_single_break
        print "\n"
        puts "back => Go back one screen"
        puts "main => Go back to main screen"
        #print_single_break
        #print "\n"
        @payload_hash.each {|key, val| puts "[#{key}] => %s " % val[0].snippet}
        print "Your Input: ".magenta
    end

    def deliver_payload(load_key)
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
        self.payload(load_key)
        print "\n"
        print_plus_break
        puts "\nYou're done with this part! Press Enter to return to previous screen!:"
        gets.chomp
    end

    def payload(load_key)
        for load in @payload_hash[load_key]
            if load.type == "explanation"
                puts load.content.light_blue
            elsif load.type == "code"
                puts load.content.yellow
            end
            sleep(1.5)
            print "\n->Press Enter to continue:".red
            gets.chomp
        end
    end

    
end
