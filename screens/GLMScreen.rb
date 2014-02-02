require_relative "screen"
require_relative "actionScreen"

class GLMScreen < ActionScreen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @payload_hash = Hash.new

    wiki_one = OpenStruct.new(:type => "explanation",
        :content => "Here we're going to start a lesson to learn more about Generalized Linear Models",
        :description => "This Wiki teaches you more details about GLM", 
        :action_badge => "GLMScreenBadge_View")

    apply_one = OpenStruct.new(:type => "explanation",
        :content => "Here we're going to actually fit a Generalized Linear Model to our dataset.",
        :description => "This Wiki walks you through fitting a GLM model to your dataset",
        :action_badge => "GLMScreenBadge_Apply")

    @payload_hash['wiki'] = [wiki_one]
    @payload_hash['apply'] = [apply_one]
  end

  def completion_badge
    return "GLMScreenBadge"
  end

end
