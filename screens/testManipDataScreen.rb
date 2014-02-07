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
    	@payload_hash['clean'] = [view_one, view_two]

        add_var_one  = OpenStruct.new(:type => "explanation",
        :content => "Here you can Add a new Variable to your Test data",
        :description => "This is where you add a new variable to your test data!",
        :action_badge => "testManipDataScreenBadge_AddVar",
        :requirement => ["GLMScreenBadge_Apply", "DTScreenBadge_Apply", "trainManipDataScreenBadge_AddVar"], #This is the list of badges that you need to enter this payload.
        :lock_description => "[LOCKED] First build a simple GLM model and a simple Decision Tree Model, and add var to train data", #The lock screen view, e.g.: [LOCKED] You have to complete cleaning your data! 
        :lock_warn => "You can't visit this until you build a simple GLM model and a simple Decision Tree Model and add var to train data" #Actual message that plays when trying to enter a locked screen "You need to clean your data!
      )
  @payload_hash['add_var'] = [add_var_one]
	end

	def visit_badge
		return "testManipDataScreenBadge"
	end

end
