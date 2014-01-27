# A simple incomplete unit testing, used for early TDD.

#require_relative 'main' #actually don't need this since this is the driver
Dir["screens/*.rb"].each {|file| require_relative file }

require 'test/unit'
#require 'byebug'

class TestBadge < Test::Unit::TestCase
  def setup
    @main_screen = MainScreen.new([])
    @action_screen = ActionScreen.new([])
    @tools_screen = ToolsScreen.new([])
    @data_screen = DataScreen.new([])
    @train_screen = TrainScreen.new([])
    @models_screen = ModelsScreen.new([])
    @train_manip_data_screen = TrainManipDataScreen.new([])
    @train_viz_data_screen = TrainVizDataScreen.new([])
    @train_view_data_screen = TrainViewDataScreen.new([])
    @test_screen = TestScreen.new([])
  end
  def test_main_badge
    badge = @main_screen.completion_badge
    assert_equal(badge, "mainScreenBadge")
  end
  def test_tools_badge
    badge = @tools_screen.completion_badge
    assert_equal(badge, "toolsScreenBadge")
  end
  def test_action_badge
    badge = @action_screen.completion_badge
    assert_equal(badge, "actionScreenBadge")
  end
  def test_data_badge
    badge = @data_screen.completion_badge
    assert_equal(badge, "dataScreenBadge")
  end
  def test_models_badge
    badge = @models_screen.completion_badge
    assert_equal(badge, "modelsScreenBadge")
  end
  def 

end

class TestBasic < Test::Unit::TestCase
  def setup
    @main_screen = MainScreen.new([])
    @tools_screen = ToolsScreen.new([@main_screen])
  end
  def test_simple_reachable
    assert_equal(1, @tools_screen.options.length)
    assert_equal(0, @main_screen.options.length)
  end
  def test_simple_reachable_2
    @main_screen.add_reachable_target(@tools_screen)
    assert_equal(1, @main_screen.options.length)
  end
end

class TestFullInsta < Test::Unit::TestCase
  def setup
  end



end
