require_relative "screen"
require_relative "actionScreen"

class TestVizDataScreen < ActionScreen
	def initialize(reachable_target, name, points)
		super(reachable_target, name, points)
		view_one = OpenStruct.new(:type => "explanation",
    		:content => "We will also teach you how to make another visualization, the pie chart.",
    		:description => "Make a piechart visualization here",
            :action_badge => "testVizDataScreenBadge_Viz",
            :requirement => ["trainVizDataScreenBadge_Viz"],
            :lock_description => "[LOCKED] First visualize the Train data.", #The lock screen view, e.g.: [LOCKED] You have to complete cleaning your data! 
            :lock_warn => "Must have visualized the Train data first" #Actual message that plays when trying to enter a locked screen "You need to clean your data!
            )
    	view_two = OpenStruct.new(:type => "code",
    		:content => "pie(table(trainData$Pclass)/length(trainData$Pclass), main = \"Train Data: % of each Pclass\")\npie(table(testData$Pclass)/length(testData$Pclass), main = \"Test Data: % of each Pclass\")"
        )
        view_three = OpenStruct.new(:type => "explanation",
            :content => "These two pie charts should look approximately similar. This way we know that the model we've\nbuild on our Train data can also be applied to our Test data")

    	@payload_hash = Hash.new
    	@payload_hash['piechart'] = [view_one, view_two, view_three]

    	view_one_density = OpenStruct.new(:type => "explanation",
    		:content => "We also check the density for the Age column to make sure its similar to the Train data",
    		:description => "Make a density visualization here",
            :action_badge => "testVizDataScreenBadge_Viz",
            :requirement => ["trainVizDataScreenBadge_Viz"],
            :lock_description => "[LOCKED] First visualize the Train data.", #The lock screen view, e.g.: [LOCKED] You have to complete cleaning your data! 
            :lock_warn => "Must have visualized the Train data first"
            )
    	view_two_density = OpenStruct.new(:type => "code",
    		:content => "plot(density(trainData$Age, na.rm = TRUE), main =\"Train Density\")\nplot(density(testData$Age,na.rm = T), main = \"Test Density\")"
        )
        view_three_density = OpenStruct.new(:type => "explanation",
            :content => "Again here you want to verify tha the distribution of your Test data is similar to your Train data\nso that the model applies.verything should look good!")
    	@payload_hash['density'] = [view_one_density, view_two_density, view_three_density]

	end

	def visit_badge
		return "testVizDataScreenBadge"
	end

end
