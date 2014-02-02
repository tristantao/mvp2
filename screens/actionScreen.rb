require_relative "screen"
require 'ostruct'
class ActionScreen < Screen

	@action_methods = nil
    @payload_hash = {}
    @payload_switch = false
    def initialize(reachable_target, name, points)
        super(reachable_target, name, points)
        @action_methods = Set.new
    end

    def enter_screen_action
        super()
    end

    def completion_badge
    	raise "actionScreenBadge missing"
    end

    def query_action (player)
        #loop to ask player for their actions.
        #return self, [false|completion_badge]
        while true
            print_double_break
            puts "\nYou're currently in the \"%s\", Choose You're options from below" % @name
            self.print_options
            raw_player_option = gets.chomp
            raw_player_option.strip!
            #byebug
            if player.KEY_TO_SCREEN.key? raw_player_option #If a special screen jump
                return raw_player_option, false
            elsif @payload_hash.key?(raw_player_option)
                payload_delivered = self.deliver_payload(raw_player_option) #false | "a badge"
                return self, payload_delivered
            else
                notify("Please enter a valid option!")
                next
            end
          end
        #return self
    end

    def print_options
        print_single_break
        print "\n"
        puts "back => Go back one screen"
        puts "main => Go back to main screen"
        #print_single_break
        #print "\n"
        @payload_hash.each {|key, val| puts "[#{key}] => %s " % val[0].description}
        print "Your Input: ".magenta
    end

    def deliver_payload(load_key)
        #@returns false if payload delivery incomplete
        #@returns corresponding badge if payload coplete
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
        payload_action_complete = self.payload(load_key)
        print "\n"
        print_plus_break
        #byebug
        if not payload_action_complete #@payload_switch
            sleep(0.25)
            notify( "\nExiting early!")
            sleep(0.50)
            return false
        end
        notify("\nYou're done with this part! Press Enter to return to previous screen!:")
        gets.chomp
        puts "Returned Badge/False:  " + String(payload_action_complete)
        return payload_action_complete
    end

    def payload(load_key)
        #returns false if the lesson wasn't completed
        #returns the corresponding action badge if completed
        for load in @payload_hash[load_key]
            if load.type == "explanation"
                puts load.content.light_blue
            elsif load.type == "code"
                puts load.content.yellow
            end
            sleep(0.75)
            print "\n->Press Enter to continue or type \"home\" to go back to the screen you began: ".red
            user_input = gets.chomp
            user_input.strip!
            if user_input == "home"
                return false
                #@payload_switch = true
                #break
            end
        end
        return @payload_hash[load_key][0].action_badge
    end
end
