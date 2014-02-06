require_relative "screen"
require_relative "actionScreen"

class TestManipDataScreen < ActionScreen
	def initialize(reachable_target, name, points)
		super(reachable_target, name, points)
		view_one = OpenStruct.new(:type => "explanation",
    		:content => "Manipulate manipulate manipulate...",
    		:description => "Manipulate your data here",
        :action_badge => "testManipDataScreenBadge_Manip",
        :requirement => ["testViewDataScreenBadge_View", "testVizDataScreenBadge_Viz"], #This is the list of badges that you need to enter this payload.
        :lock_description => "[LOCKED] First view and vizualize the train data.", #The lock screen view, e.g.: [LOCKED] You have to complete cleaning your data! 
        :lock_warn => "You can't visit this until you view and vizualize the train data!" #Actual message that plays when trying to enter a locked screen "You need to clean your data!
      )

    	view_two = OpenStruct.new(:type => "code",
    		:content => "some code")

    	@payload_hash = Hash.new
    	@payload_hash['view'] = [view_one, view_two]
	end

	def visit_badge
		return "testManipDataScreenBadge"
	end

end
