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

    def visit_badge
        raise "actionScreenBadge missing"
    end

    def query_action (player)
        #loop to ask player for their actions.
        #return self, [false|visit_badge]
        while true
            print_double_break
            puts @description
            print_single_break
            puts "You're currently in the \"%s\", Choose You're options from below" % @name
            self.print_options(player)
            raw_player_option = gets.chomp
            raw_player_option.strip!
            #byebug
            if player.KEY_TO_SCREEN.key? raw_player_option #If a special screen jump
                return raw_player_option, false
            elsif @payload_hash.key?(raw_player_option) #if one of the payload in [***] is selected
                if can_visit_payload(player, raw_player_option) #Has this person completed the badges? Print error otherwise.
                    payload_delivered = self.deliver_payload(raw_player_option) #false | "a badge"
                    return self, payload_delivered
                else
                    next
                end
            else
                notify("Please enter a valid option!")
                next
            end
          end
        #return self
    end

    def can_visit_payload(player, raw_player_option)
        #If the player can visit the screen, return true. else print error msg, and return false
        attempted_payload = @payload_hash[raw_player_option]
        attempted_payload_header = attempted_payload[0]

        if player.completed?(attempted_payload_header.requirement)
            return true
        else #can't visit that yet, the player hasn't finished visiting all the needed views!
            puts notify(attempted_payload_header.lock_warn)
            return false
        end

    end

    def print_options (player)
        print_single_break
        puts "back => Go back one screen"
        puts "main => Go back to main screen"
        @payload_hash.each do |key, val| #check to see if the player has the certain badge
            option = val[0]
            if player.completed?(option.requirement)
                puts "[#{key}] => %s " % option.description
            else
                puts "[#{key}] => %s " % option.lock_description
            end
        end
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
        print "complete!\n".green
        sleep(rand*1.5)
        print_plus_break
        print "\n"
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
                puts "\n" + load.content.light_blue
            elsif load.type == "code"
                puts "\n" + load.content.yellow
            else
                puts "\n" + load.content.green
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
