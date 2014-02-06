require_relative "screen"
require_relative "actionScreen"

class TrainManipDataScreen < ActionScreen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @payload_hash = Hash.new

    manip_one = view_one = OpenStruct.new(:type => "explanation",
    		:content => "Here you can manipulate your Training data",
    		:description => "This is where you manipulate training data!",
        :action_badge => "trainManipDataScreenBadge_Manip",
        :requirement => nil, #This is the list of badges that you need to enter this payload.
        :lock_description => nil, #The lock screen view, e.g.: [LOCKED] You have to complete cleaning your data! 
        :lock_warn => nil #Actual message that plays when trying to enter a locked screen "You need to clean your data!
      )

    @payload_hash['view'] = [manip_one]

  end

  def visit_badge
    return "trainManipDataScreenBadge"
  end

end
