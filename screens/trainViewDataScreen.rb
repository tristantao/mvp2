require_relative "screen"
require_relative "actionScreen"

class TrainViewDataScreen < ActionScreen

  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    view_one  = OpenStruct.new(:type => "explanation", 
      :content => "Here, you learn how to inspect the data. In R,  we utilize the following function to achieve that goal:",
      :description => "This is where you view and explore the data!")
    view_two = OpenStruct.new(:type => "code",
      :content => "edit(trainData)")

    @payload_hash = Hash.new
    @payload_hash['view'] = [view_one, view_two]

=begin Example if you wanted to add another lesson here
   pie_one = OpenStruct.new(:type => "explnation",
      :content => "We're now going to build a pie chart!",
      :description = "Build a pie chart!")

    @payload_hash['piechart'] = [pie_one, pie_two]
=end
  end

  def completion_badge
    return "trainViewDataScreenBadge"
  end

end
