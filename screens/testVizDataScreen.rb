require_relative "screen"
require_relative "actionScreen"

class TestVizDataScreen < ActionScreen
	def initialize(reachable_target, name, points)
		super(reachable_target, name, points)
		view_one = OpenStruct.new(:type => "explanation",
    		:content => "Visualizations are important....",
    		:description => "Make a density visualization here",
            :action_badge => "testVizDataScreenBadge_Viz")
    	view_two = OpenStruct.new(:type => "code",
    		:content => "some code")

    	@payload_hash = Hash.new
    	@payload_hash['density'] = [view_one, view_two]

    	view_one_barplot = OpenStruct.new(:type => "explanation",
    		:content => "Visualizations are important....",
    		:description => "Make a barplot visualization here")
    	view_two_barplot = OpenStruct.new(:type => "code",
    		:content => "some code")

    	@payload_hash['barplot'] = [view_one_barplot, view_two_barplot]

	end

	def completion_badge
		return "testVizDataScreenBadge"
	end

end
