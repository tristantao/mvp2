require_relative "screen"
require_relative "actionScreen"

class TrainVizDataScreen < ActionScreen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @payload_hash = Hash.new

    manip_one = view_one = OpenStruct.new(:type => "explanation",
    		:content => "Here you can vizualize your Training data",
    		:description => "This is where you vizualize your training data!",
            :action_badge => "trainVizDataScreenBadge_Viz")

    
  end

  def completion_badge
    return "trainVizDataScreenBadge"
  end

end
