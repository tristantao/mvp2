require 'set'

class Player

  attr_reader :KEY_TO_SCREEN

   @current_screen = nil
#   @last_screen = nil
   @visit_badges = nil # Add things here as the person completes
   @completion_point = 0 #get points everytime they do an action we expect
   @main_screen = nil #won't be changed for the rest of the lifecycle
   @action_badges = nil

   @KEY_TO_SCREEN = nil
   @screen_stack = nil
   # MAKE AN Array: and use push() and pop() to keep track of which screen your own when
   # you do back


  def initialize(screen)
    @current_screen = screen
    @main_screen = screen
    @visit_badges = Set.new
    @action_badges = Set.new
    @KEY_TO_SCREEN = {"main" => @main_screen, "back" => screen}
    @screen_stack = []
  end

  def do
    @screen_stack.push(@current_screen)
    new_screen, result_badge = @current_screen.query_action(self)
    if result_badge #Successfully finished a payload
      @action_badges << result_badge
    end
    #byebug

    # HERE IS WHERE YOU NEED TO PUT SCREENS INTO A STACK, make sure its unique and if
    if @KEY_TO_SCREEN.key?(new_screen) #Special screen jump
      puts @screen_stack.pop
      @KEY_TO_SCREEN['back'] = @screen_stack.pop
      @current_screen = @KEY_TO_SCREEN[new_screen]



      #temp_screen = @current_screen
      #@current_screen = @KEY_TO_SCREEN[new_screen]
      #@last_screen = temp_screen
    else #regular screen jump
      if new_screen != @current_screen #prevent losing "backability" when getting to the same screen
          #byebug
          #@KEY_TO_SCREEN['back'] = @screen_stack.pop
      end
      @visit_badges << @current_screen.visit_badge
      @current_screen = new_screen
   end
   #byebug
   puts @screen_stack
   @current_screen.enter_screen_action() #printing screen info/payload happens here
   return true
  end

  def completed?(badges)
    #returns true if the user has acquired the list of badges
    #nil means no req so return true.
    if badges == nil
      return true
    else
      #byebug
      for badge in badges do
        if @action_badges.include?(badge) or @visit_badges.include?(badge)
          next
        else #missing a badge
          return false
        end
      end
    end
    return true
  end


end
