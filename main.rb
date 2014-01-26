require_relative "player"
require 'byebug'

Dir["screens/*.rb"].each {|file| require_relative file }
#require_relative "screens/mainScreen"
#require_relative "screens/toolsScreen"

SCREENS_LIST = []


train_manip_data_screen = TrainManipDataScreen.new([], "Train Manipulate Screen", 0)
train_viz_data_screen = TrainVizDataScreen.new([], "Train Vizualize Screen", 0)
train_view_data_screen = TrainViewDataScreen.new([], "Train View Screen", 0)

train_screen = TrainScreen.new([train_view_data_screen, train_viz_data_screen, train_manip_data_screen],
	 "Train Data Screen", 0)
test_screen = TestScreen.new([], "Test Data Screen", 0) #TODO


data_screen = DataScreen.new([train_screen, test_screen]m "Data Scren")


#Do tools update here
tools_screen = ToolsScreen.new([], "Tools Screen", 0) #TODO


main_screen = MainScreen.new([data_screen, tools_screen], "Main Screen")




main_player = Player.new(main_screen)
PLAYERS_LIST = [main_player]

while true
  for person in PLAYERS_LIST
  	puts "main loop"
    person.do()
  end
end

