require_relative "player"
require 'byebug'

Dir["screens/*.rb"].each {|file| require_relative file }
#require_relative "screens/mainScreen"
#require_relative "screens/toolsScreen"

SCREENS_LIST = []


train_manip_data_screen = TrainManipDataScreen.new([])
train_viz_data_screen = TrainVizDataScreen.new([])
train_view_data_screen = TrainViewDataScreen.new([])

train_screen = TrainScreen.new([train_view_data_screen, train_viz_data_screen, train_manip_data_screen])
test_screen = TestScreen.new([]) #TODO


data_screen = DataScreen.new([train_screen, test_screen])


#Do tools update here
tools_screen = ToolsScreen.new([]) #TODO


main_screen = MainScreen.new([data_screen, tools_screen])




main_player = Player.new(main_screen)
PLAYERS_LIST = [main_player]

while true
  for person in PLAYERS_LIST
  	puts "main loop"
    person.do()
  end
end

