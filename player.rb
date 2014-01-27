require 'set'

class Player

  attr_reader :KEY_TO_SCREEN

   @current_screen = nil
   @last_screen = nil
   @completion_state = nil # Add things here as the person completes 
   @completion_point = 0 #get points everytime they do an action we expect
   @main_screen = nil #won't be changed for the rest of the lifecycle

   @KEY_TO_SCREEN = nil

  def initialize(screen)
    @current_screen = screen
    @main_screen = screen
    @completion_state = Set.new
    @KEY_TO_SCREEN = {"main" => @main_screen, "back" => screen}
  end

  def do
    new_screen = @current_screen.query_action(self)
    #byebug
    if @KEY_TO_SCREEN.key?(new_screen) #Special screen jump
      temp_screen = @current_screen
      @current_screen = @KEY_TO_SCREEN[new_screen]
      @last_screen = temp_screen
    else #just a screen
      @KEY_TO_SCREEN['back'] = @current_screen 
      @completion_state << @current_screen.completion_badge
      @current_screen = new_screen
   end
   #byebug
   @current_screen.enter_screen_action() #printing screen info/payload happens here
   return true
  end
end
