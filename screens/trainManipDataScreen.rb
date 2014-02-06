require_relative "screen"
require_relative "actionScreen"

class TrainManipDataScreen < ActionScreen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @payload_hash = Hash.new

    manip_one = view_one = OpenStruct.new(:type => "explanation",
    		:content => "Here you can manipulate your Training data",
    		:description => "This is where you manipulate training data!",
        :action_badge => "trainManipDataScreenBadge_Manip")

    @payload_hash['view'] = [manip_one]

  end

  def completion_badge
    return "trainManipDataScreenBadge"
  end

end
