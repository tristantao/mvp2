require_relative "player"
require 'byebug'

#Dir["screens/*.rb"].each {|file| require file }
require_relative "screens/mainScreen"

SCREENS_LIST = []

main_screen = MainScreen.new()
main_player = Player.new(main_screen)
PLAYERS_LIST = [main_player]

while true
  for person in PLAYERS_LIST
    person.do()
  end
end

