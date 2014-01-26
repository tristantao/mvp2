# A simple incomplete unit testing, used for early TDD.

#require_relative 'main' #actually don't need this since this is the driver
Dir["screens/*.rb"].each {|file| require_relative file }

require 'test/unit'
#require 'byebug'

class TestBadge < Test::Unit::TestCase

  def setup
    @main_screen = MainScreen.new()
    @tools_screen = ToolsScreen.new()
    @data_screen = DataScreen.new()
    @train_screen = TrainScreen.new()
    @train_manip_data_screen = TrainManipDataScreen.new()
    @train_viz_data_screen = TrainVizDataScreen.new()
    @train_view_data_screen = TrainViewDataScreen.new()
    @test_screen = TestScreen.new()
  end

  def test_main_badge
    badge = @main_screen.completion_badge
    assert_equal(badge, "mainScreenBadge")
  end
    
  def test_tools_screen
    badge = @tools_screen.completion_badge
    assert_equal(badge, "toolsScreenBadge") 
  end

=begin
  def test_deck_size
    #tests that 52 cards are instantiated
    a = Deck.instance
    a_deck_1 = a.new_shuffled_deck(1).length
    a_deck_2 = a.new_shuffled_deck(2).length
    assert_equal(52, a_deck_1)
    assert_equal(104, a_deck_2)
    b = Deck.instance
    assert_equal(52, b.new_shuffled_deck(1).length)
  end

  def test_cards
    #test that the content of the deck is equivalent to a full deck
    a = Deck.instance
    a_deck_1 = a.new_shuffled_deck(1)
    value_hash_received = Hash.new(0)
    for card in a_deck_1
      value_hash_received[Card.evaluate([card])] = value_hash_received[Card.evaluate([card])] + 1
    end
    for answer_check in 2..9
      #check that each number appears 4 times
      assert_equal(4, value_hash_received[answer_check])
    end
    #check that there are 20 10's.
    assert_equal(16, value_hash_received[10])
    assert_equal(4, value_hash_received[11])
  end
=end
end
