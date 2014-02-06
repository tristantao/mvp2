require_relative "screen"
require_relative "actionScreen"

class DTScreen < ActionScreen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @payload_hash = Hash.new
    wiki_one = OpenStruct.new(:type => "explanation",
        :content => "Here we're going to start a lesson to learn more about Random Forest",
        :description => "This Wiki teaches you more details about Random Forest",
        :action_badge => "DTScreenBadge_Wiki")

    apply_one = OpenStruct.new(:type => "explanation",
        :content => "Here we're going to actually fit a Random Forest to our dataset.",
        :description => "This Wiki walks you through fitting a RF model to your dataset",
        :action_badge => "DTScreenBadge_Apply",
        :requirement => ["trainManipDataScreenBadge_Manip", "trainViewDataScreen_View", "trainVizDataScreenBadge_Viz",
                          "testManipDataScreenBadge_Manip", "testViewDataScreenBadge_View", "testVizDataScreenBadge_Viz"], #This is the list of badges that you need to enter this payload.
        :lock_description => "[LOCKED] You must first explore/clean the train/test data first!", #The lock screen view, e.g.: [LOCKED] You have to complete cleaning your data! 
        :lock_warn => "You can't go there yet! First finish working with data!" #Actual message that plays when trying to enter a locked screen "You need to clean your data!
      )
    @payload_hash['wiki'] = [wiki_one]
    @payload_hash['apply'] = [apply_one]
  end

  def visit_badge
    return "DTScreenBadge"
  end

end
