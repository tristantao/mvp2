require_relative "screen"
require_relative "actionScreen"

class TrainViewDataScreen < ActionScreen

  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    view_one  = OpenStruct.new(:type => "explanation",
      :content => "Here, you learn how to inspect the data. In R,  we utilize the following function to achieve that goal:",
      :description => "This is where you view and explore the data!",
      :action_badge => "trainViewDataScreenBadge_View",
      :requirement => nil, #This is the list of badges that you need to enter this payload.
      :lock_description => nil, #The lock screen view, e.g.: [LOCKED] You have to complete cleaning your data! 
      :lock_warn => nil) #Actual message that plays when trying to enter a locked screen "You need to clean your data!
       #Finish the Data Screen actions!"

    view_two = OpenStruct.new(:type => "code",
      :content => "edit(trainData)")

    view_three = OpenStruct.new(:type => "explanation",
      :content => "\nFUCK YOUR COUCH")

    view_four = OpenStruct.new(:type => "explanation",
      :content => "\nblah blah blah blah blah")

    @payload_hash = Hash.new
    @payload_hash['view'] = [view_one, view_two, view_three, view_four]

=begin Example if you wanted to add another lesson here
   pie_one = OpenStruct.new(:type => "explnation",
      :content => "We're now going to build a pie chart!",
      :description = "Build a pie chart!")

    @payload_hash['piechart'] = [pie_one, pie_two]
=end
  end

  def visit_badge
    return "trainViewDataScreenBadge"
  end

end
