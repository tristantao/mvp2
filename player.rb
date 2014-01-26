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
      @current_screen.query_action()
      @completion_state << @current_screen.completion_badge
    end
  end
end
