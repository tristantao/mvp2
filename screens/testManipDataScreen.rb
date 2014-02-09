require_relative "screen"
require_relative "actionScreen"

class TestManipDataScreen < ActionScreen
	def initialize(reachable_target, name, points)
		super(reachable_target, name, points)
        @display_description = "Manipulate the testing data"
    @description = "Here's where we get our hands dirty.
Cleaning the data involves making inferences on any missing values as well as converting
the categorical variables to dummary variables. Adding variables involves creating additional
variables which strengthen the predictability of our models."

		view_one = OpenStruct.new(:type => "header",
    		:content => "Same deal as with the Train data. We remove columns we don't use in\nour analysis, make inferences on the missing age values, and create dummy variables\nfor the Sex column",
    		:description => "Manipulate your data here",
        :action_badge => "testManipDataScreenBadge_Manip",
        :requirement => ["testViewDataScreenBadge_View", "testVizDataScreenBadge_Viz"], #This is the list of badges that you need to enter this payload.
        :lock_description => "[LOCKED] First view and vizualize the Test data.", #The lock screen view, e.g.: [LOCKED] You have to complete cleaning your data!
        :lock_warn => "You can't visit this until you view and vizualize the Train data!" #Actual message that plays when trying to enter a locked screen "You need to clean your data!
      )

    	view_two = OpenStruct.new(:type => "explanation",
    		:content => "testData <- testData[-c(1, 8:11)]\ntestData$Sex <- gsub(\"female\", 1, testData$Sex)\ntestData$Sex <- gsub(\"^male\", 0, testData$Sex)\ntest_mean_age <- mean(testData$Age, na.rm= T)\nfor (i in 1:nrow(testData)) {\nif (is.na(testData[i,4])) {\ntestData[i, 4] <- test_mean_age\n  }\n}"
            )
        view_three = OpenStruct.new(:type => "finish",
        :content => "All done."
        )
    	@payload_hash = Hash.new
    	@payload_hash['cleaning'] = [view_one, view_two, view_three]

        add_var_one  = OpenStruct.new(:type => "header",
        :content => "We've already given you the variables we brainstormed but try to do a few yourself. Just remember to add the variables to BOTH of the datasets!\nHere's the code for the Test data variables.",
        :description => "This is where you bolster your model with new variables applied to your Test data!",
        :action_badge => "testManipDataScreenBadge_AddVar",
        :requirement => ["GLMScreenBadge_Apply", "CTScreenBadge_Apply", "trainManipDataScreenBadge_AddVar"], #This is the list of badges that you need to enter this payload.
        :lock_description => "[LOCKED] First build a simple GLM model and a simple Classification Tree Model, and add var to train data", #The lock screen view, e.g.: [LOCKED] You have to complete cleaning your data!
        :lock_warn => "You can't visit this until you build a simple GLM model and a simple Classification Tree Model and add var to train data" #Actual message that plays when trying to enter a locked screen "You need to clean your data!
        )
        add_var_two = OpenStruct.new(:type => "code",
        :content => "testData[\"Child\"] <- NA\nfor (i in 1:nrow(testData)) {\nif (testData[i, 4] <= 12) {\n    testData[i, 7] <- 1\n  } else {\n    testData[i, 7] <- 2\n  }\n}\ntestData[\"Family\"] <- NA\nfor(i in 1:nrow(testData)) {\n  testData[i, 8] <- testData[i, 5] + testData[i, 6] + 1\n}\ntestData[\"Mother\"] <- NA\nfor(i in 1:nrow(testData)) {\n  if(testData[i, 2] == \"Mrs\" & testData[i, 6] > 0) {\n    testData[i, 9] <- 1\n  } else {\n    testData[i, 9] <- 2\n  }\n}\n"
        )
        add_var_three = OpenStruct.new(:type => "finish",
        :content => "All done."
        )
  @payload_hash['adding_variables'] = [add_var_one, add_var_two, add_var_three]
	end

	def visit_badge
		return "testManipDataScreenBadge"
	end

end
