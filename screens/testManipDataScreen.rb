require_relative "screen"
require_relative "actionScreen"

class TestManipDataScreen < ActionScreen
	def initialize(reachable_target, name, points)
		super(reachable_target, name, points)
		view_one = OpenStruct.new(:type => "explanation",
    		:content => "Manipulate manipulate manipulate...",
    		:description => "Manipulate your data here",
            :action_badge => "testManipDataScreenBadge_Manip")
    	view_two = OpenStruct.new(:type => "code",
    		:content => "some code")

    	@payload_hash = Hash.new
    	@payload_hash['view'] = [view_one, view_two]
	end

	def visit_badge
		return "testManipDataScreenBadge"
	end

end
