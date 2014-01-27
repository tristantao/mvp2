require 'set'

class Player

   @current_screen = nil;
   @completion_state = nil; # Add things here as the person completes 
   @completion_point = 0; #get points everytime they do an action we expect

  def initialize(screen)
    @current_screen = screen
    @completion_state = Set.new
  end

  def do
    while true #query for action
      action_talen = @current_screen.query_action()
      if action_taken #success!
        @completion_state << @current_screen.completion_badge
        break
      end    
    end
    return true
  end
end
