require 'set'

class Player

   @current_screen = nil;
   @last_screen = nil;
   @completion_state = nil; # Add things here as the person completes 
   @completion_point = 0; #get points everytime they do an action we expect

  def initialize(screen)
    @current_screen = screen
    @last_screen = screen
    @completion_state = Set.new
  end

  def do
    new_screen = @current_screen.query_action()
    if new_screen == "last_screen"
      temp_screen = @current_screen
      @current_screen = @last_screen
      @last_screen = temp_screen
    else
      @last_screen = @current_screen
      @completion_state << @current_screen.completion_badge
      @current_screen = new_screen
   end
   @current_screen.enter_screen_action() #printing screen info/payload happens here
   return true
  end
end
