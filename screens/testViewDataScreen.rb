require_relative "screen"
require_relative "actionScreen"

class TestViewDataScreen < ActionScreen
	def initialize(reachable_target, name, points)
		super(reachable_target, name, points)
        @display_description = "View the testing data"
        @description = "See additional functions you can use in RStudio to view your data."

    	view_one = OpenStruct.new(:type => "explanation",
    		:content => "Here are some additional functions you can use to view data in R:",
    		:description => "This is where you view and explore the test data!",
            :action_badge => "testViewDataScreenBadge_View",
            :requirement => ["trainViewDataScreenBadge_View"],
            :lock_description => "[LOCKED] You must have viewed train datasets first!", #The lock screen view, e.g.: [LOCKED] You have to complete cleaning your data!
            :lock_warn => "View train data first, and then we'll do similar things on Test data after!" #Actual message that plays when trying to enter a locked screen "You need to clean your data!
        )
    	view_two = OpenStruct.new(:type => "code",
    		:content => "tail(testData, 10)\nhead(testData, 10)\ntestData")

        view_three = OpenStruct.new(:type => "explanation",
            :content => "Like the Unix commands, head() and tail() each prints a number of specified lines (10 here)
from either the start (head) or the finish (tail) of the data object.
Simply writing the data object name prints the whole thing.")
    	@payload_hash = Hash.new
    	@payload_hash['view'] = [view_one, view_two, view_three]

	end

	def visit_badge
		return "testViewDataScreenBadge"
	end

end
