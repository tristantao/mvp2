require_relative "screen"
require_relative "actionScreen"

class TestVizDataScreen < ActionScreen
	def initialize(reachable_target, name, points)
		super(reachable_target, name, points)
		view_one = OpenStruct.new(:type => "explanation",
    		:content => "We will also teach you how to make another visualization, the pie chart.",
    		:description => "Make a piechart visualization here",
            :action_badge => "testVizDataScreenBadge_Viz")
    	view_two = OpenStruct.new(:type => "code",
    		:content => "pie(table(trainData$Pclass)/length(trainData$Pclass), main = \"Train Data: % of each Pclass\")\npie(table(testData$Pclass)/length(testData$Pclass), main = \"Test Data: % of each Pclass\")"
        )

    	@payload_hash = Hash.new
    	@payload_hash['piechart'] = [view_one, view_two]

    	view_one_density = OpenStruct.new(:type => "explanation",
    		:content => "We also check the density for the Age column to make sure its similar to the Train data",
    		:description => "Make a density visualization here",
            :action_badge => "testVizDataScreenBadge_Viz")
    	view_two_density = OpenStruct.new(:type => "code",
    		:content => "plot(density(trainData$Age, na.rm = TRUE), main =\"Train Density\")\nplot(density(testData$Age,na.rm = T), main = \"Test Density\")"
        )
        view_three_density = OpenStruct.new(:type => "explanation",
            :content => "What you want to verify is that the visualizations of the two pie charts and the two density plots look approximately similar. Everything should look good!")
    	@payload_hash['density'] = [view_one_density, view_two_density, view_three_density]

	end

	def visit_badge
		return "testVizDataScreenBadge"
	end

end
