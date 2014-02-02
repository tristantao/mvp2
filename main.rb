require_relative "player"
require 'byebug'

Dir["screens/*.rb"].each {|file| require_relative file }
#require_relative "screens/mainScreen"
#require_relative "screens/toolsScreen"

SCREENS_LIST = []


#From Train Node
train_manip_data_screen = TrainManipDataScreen.new([], "Train Manipulate Screen", 0)
train_viz_data_screen = TrainVizDataScreen.new([], "Train Vizualize Screen", 0)
train_view_data_screen = TrainViewDataScreen.new([], "Train View Screen", 0)
#From Test Node
#test_manip_data_screen = TestManipDataScreen.new([], "Test Manipulate Screen", 0)
#test_viz_data_screen = TestVizDataScreen.new([], "Test Visualize Screen", 0)
#test_view_data_screen = TestViewDataScreen.new([], "Test View Screen", 0)

#From Data Node
train_screen = TrainScreen.new([train_view_data_screen, train_viz_data_screen, train_manip_data_screen],
	 "Train Data Screen", 0)

#test_screen = TestScreen.new([test_view_data_screen, test_viz_data_screen, test_manip_data_screen],
#	"Test Data Screen", 0)

data_screen = DataScreen.new([train_screen], "Data Screen", 0)

tools_screen = ToolsScreen.new([], "Tools Screen", 0) #TODO Update Tools screen

models_screen = ModelsScreen.new([], "Models Screen", 0)


#MainScreen Node
main_screen = MainScreen.new([data_screen, models_screen, tools_screen], "Main Screen", 0)


main_player = Player.new(main_screen)
PLAYERS_LIST = [main_player]

puts "Starting Tutorial:"
while true
  for person in PLAYERS_LIST
  	# => puts "main loop"
    person.do()
  end
end

