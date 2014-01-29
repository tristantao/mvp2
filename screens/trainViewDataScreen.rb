require_relative "screen"
require_relative "actionScreen"

class TrainViewDataScreen < ActionScreen

  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    one  = OpenStruct.new(:type => "explanation", 
      :content => "Here, you learn how to inspect the data. In R,  we utilize the following function to achieve that goal:",
      :snippet => "This is where you view and explore the data!")

    two = OpenStruct.new(:type => "code", 
      :content => "edit(trainData)")
    @payload_hash = Hash.new
    @payload_hash['view'] = [one, two]
  end

  def completion_badge
    return "trainViewDataScreenBadge"
  end

end
