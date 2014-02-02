require_relative "screen"
require_relative "actionScreen"

class TestViewDataScreen < ActionScreen
	def initialize(reachable_target, name, points)
		super(reachable_target, name, points)
    	view_one = OpenStruct.new(:type => "explanation",
    		:content => "Here are some additional functions you can use to view data in R:",
    		:description => "This is where you view and explore the data!")
    	view_two = OpenStruct.new(:type => "code",
    		:content => "tail(testData)\nhead(testData)\ntestData")

    	@payload_hash = Hash.new
    	@payload_hash['view'] = [view_one, view_two]

	end

	def completion_badge
		return "testViewDataScreenBadge"
	end

end