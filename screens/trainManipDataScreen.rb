require_relative "screen"
require_relative "actionScreen"

class TrainManipDataScreen < ActionScreen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @payload_hash = Hash.new

    manip_one = OpenStruct.new(:type => "explanation",
    		:content => "Here you can manipulate your Training data",
    		:description => "This is where you manipulate training data!",
        :action_badge => "trainManipDataScreenBadge_Manip",
        :requirement => ["trainViewDataScreenBadge_View", "trainVizDataScreenBadge_Viz"], #This is the list of badges that you need to enter this payload.
        :lock_description => "[LOCKED] First view and vizualize the train data.", #The lock screen view, e.g.: [LOCKED] You have to complete cleaning your data! 
        :lock_warn => "You can't visit this until you view and vizualize the train data!" #Actual message that plays when trying to enter a locked screen "You need to clean your data!
      )

    @payload_hash['clean'] = [manip_one]

    add_var_one  = OpenStruct.new(:type => "explanation",
        :content => "Here you can Add a new Variable to your Training data",
        :description => "This is where you add a new variable to your training data!",
        :action_badge => "trainManipDataScreenBadge_AddVar",
        :requirement => ["GLMScreenBadge_Apply", "DTScreenBadge_Apply"], #This is the list of badges that you need to enter this payload.
        :lock_description => "[LOCKED] First build a simple GLM model and a simple Decision Tree Model.", #The lock screen view, e.g.: [LOCKED] You have to complete cleaning your data! 
        :lock_warn => "You can't visit this until you build a simple GLM model and a simple Decision Tree Model" #Actual message that plays when trying to enter a locked screen "You need to clean your data!
      )
  @payload_hash['add_var'] = [add_var_one]

  end

  def visit_badge
    return "trainManipDataScreenBadge"
  end

end
