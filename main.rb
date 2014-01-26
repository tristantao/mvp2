require_relative "player"
require 'byebug'

Dir["screens/*.rb"].each {|file| require_relative file }
#require_relative "screens/mainScreen"
#require_relative "screens/toolsScreen"

SCREENS_LIST = []

main_screen = MainScreen.new()

tools_screen = ToolsScreen.new()

data_screen = DataScreen.new()
train_screen = TrainScreen.new()


test_screen = TestScreen.new()



main_player = Player.new(main_screen)
PLAYERS_LIST = [main_player]

while true
  for person in PLAYERS_LIST
  	puts "main loop"
    person.do()
  end
end

