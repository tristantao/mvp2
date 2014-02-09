# -*- coding: utf-8 -*-
require_relative "screen"
require_relative "actionScreen"

class GLMScreen < ActionScreen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @description = "You chose to apply logistic regression.
You can learn more about the theory and concepts and/or you can simply straight apply it to our data project."

    @display_description = "Learn and build a Generalized Linear Model here"

    @payload_hash = Hash.new

    wiki_one = OpenStruct.new(:type => "header",
        :content => "A logistic regression model is a generalized linear model
which gives you the probability of whether or not an observation is in a group which is
typically categorical. Since whether a passenger survived or not is binary, we use logistic regression.
Linear regression is applied when the variable you are predicting is continuous.",
        :description => "This Wiki teaches you more details about GLM",
        :action_badge => "GLMScreenBadge_View")
    @payload_hash['wiki'] = [wiki_one]

    apply_one = OpenStruct.new(:type => "explanation",
        :content => "The theory of logistic regression is much more complicated mathematically
so we will not go into it in this tutorial. R will take care of solving/optimizing the model.
The predictions for each observation come in from the model in the form of a probability score
for Survived being 0 or 1. Write the following code to build your logistic model:",
        :description => "Fit a GLM model to your dataset",
        :action_badge => "GLMScreenBadge_Apply",
        :requirement => ["trainManipDataScreenBadge_Manip", "trainViewDataScreen_View", "trainVizDataScreenBadge_Viz",
                          "testManipDataScreenBadge_Manip", "testViewDataScreenBadge_View", "testVizDataScreenBadge_Viz"],
        :lock_description => "[LOCKED] You must first explore/clean the train/test data first!",
        :lock_warn => "Must have cleaned TEST/TRAIN data (The logistic regression model cannot be applied before you fully manipulate/clean both datasets!)")

    apply_two = OpenStruct.new(:type => "code",
        :content => "train.glm <- glm(Survived ~ Pclass + Sex + Age + Child + Sex*Pclass + Family + Mother, family = binomial, data = trainData)
summary(train.glm)")
    apply_three = OpenStruct.new(:type => "explanation",
                                 :content => "We must apply a cutoff value to determine which probability scores translate to a 1 and
which translate to a 0. For simplicity it is generally most effective to choose a cutoff of .5 to minimize errors.
Write the following code into your Rscript:")
    apply_four = OpenStruct.new(:type => "code",
                                :content => "p.hats <- predict.glm(train.glm, newdata = testData, type = \"response\")
\nsurvival <- vector()
for(i in 1:length(p.hats)) {
  if(p.hats[i] > .5) {
    survival[i] <- 1
  } else {
    survival[i] <- 0
  }
}")
    apply_five = OpenStruct.new(:type => "explanation",
                               :content => "To finish this up for submission to Kaggle we write the following code:")
    apply_six = OpenStruct.new(:type => "code",
                :content => "kaggle_logistic_sub <- cbind(PassengerId,survival)
colnames(kaggle_logistic_sub) <- c(\"PassengerId\", \"Survived\")
write.csv(kaggle_logistic_sub, file = \"kaggle.csv\", row.names = FALSE)")
    apply_seven = OpenStruct.new(:type => "code",
                :content => "Again, make sure the CSV you submit has only two columns:
one labeled as “PassengerID” and another labeled as “Survived”. Hopefully your score improved!")

    @payload_hash['apply'] = [apply_one, apply_two, apply_three, apply_four, apply_five]
  end

  def visit_badge
    return "GLMScreenBadge"
  end

end
