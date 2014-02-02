require_relative "screen"
require_relative "actionScreen"

class GLMScreen < ActionScreen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @payload_hash = Hash.new
    wiki_one = OpenStruct.new(:type => "explanation",
        :content => "Here we're going to start a lesson to learn more about Random Forest",
        :description => "This Wiki teaches you more details about Random Forest")

    apply_one = OpenStruct.new(:type => "explanation",
        :content => "Here we're going to actually fit a Random Forest to our dataset.",
        :description => "This Wiki walks you through fitting a RF model to your dataset")

    @payload_hash['wiki'] = [wiki_one]
    @payload_hash['apply'] = [apply_one]

  end

  def completion_badge
    return "RFScreenBadge"
  end

  def completion_action_badge
  	return "RFActionBadge"
  end

end
