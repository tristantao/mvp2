require_relative "screen"
require_relative "actionScreen"

class TrainVizDataScreen < ActionScreen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @payload_hash = Hash.new
    @description = "Doing visualizations of the data allow you understand it better before you begin any analysis. Which one should you do first?"

    dp_one = OpenStruct.new(:type => "header",
    		:content => "By first plotting the density we're able to get a sense of how the overall
data feel and get a few vague answers:
where is the general center?
Is there a skew?
Does is generally take higher values?
Where are most of the values concentrated?",
    		:description => "Build density plots on training data.",
        :action_badge => "trainVizDataScreenBadge_Viz",
        :requirement => ["trainViewDataScreenBadge_View"], #This is the list of badges that you need to enter this payload.
        :lock_description => "[LOCKED] First view the train data.", #The lock screen view, e.g.: [LOCKED] You have to complete cleaning your data!
        :lock_warn => "Must have viewed data first (Whoa there, how about we just take a look at the data first?)") #Actual message that plays when trying to enter a locked screen "You need to clean your data!)
    dp_two = OpenStruct.new(:type => "code",
      :content => "plot(density(trainData$Age, na.rm = TRUE))
plot(density(trainData$Fare, na.rm = TRUE))")
    dp_three = OpenStruct.new(:type => "explanation",
  :content => "It doesn't hurt to just visualize the data by columns as well. You might notice something fishy...")
    dp_four = OpenStruct.new(:type => "code", :content => "trainData$Age")

    @payload_hash['density_plot'] = [dp_one, dp_two, dp_three, dp_four]

    bp_one = OpenStruct.new(:type => "header",
        :content => "Lets now look at the survival rate filtered by sex.
Our intuition is that women had a higher chance of surviving because
the crewman used the standard \"Women and Childre first\" to board the lifeboats.
We first create a table and call it counts. Then we use R's barplot() function.
We also calculate the male/female survival rates from the table by indexing the table we made called counts.",
        :description => "Build bar plots on training data.",
        :action_badge => "trainVizDataScreenBadge_Viz",
        :requirement => ["trainViewDataScreenBadge_View"], #This is the list of badges that you need to enter this payload.
        :lock_description => "[LOCKED] First view the train data.", #The lock screen view, e.g.: [LOCKED] You have to complete cleaning your data!
        :lock_warn => "Whoa there, how about we just take a look at the data first?" #Actual message that plays when trying to enter a locked screen "You need to clean your data!
      )
    bp_two = OpenStruct.new(:type => "code",
      :content => "counts <- table(trainData$Survived, trainData$Sex)
barplot(counts, xlab = \"Gender\", ylab = \"Number of People\", main = \"survived and deceased between male and female\")
counts[2] / (counts[1] + counts[2])
counts[4] / (counts[3] + counts[4])")
    bp_three = OpenStruct.new(:type => "explanation",
      :content => "Note that in the barplot you create the lighter areas indicate survival.
Doing the calculations below the barplot we see that in our Train data, 74.2% of women survived versus 18.9% of men.")
    bp_four = OpenStruct.new(:type => "explanation",
      :content => "Lets now look at the survival rate filtered by passenger class.
It seems like the Pclass column might also be informative in survival prediction as the survival rate of the 1st class,
2nd class, and 3rd class are: 63.0%, 47.3%, and 24.2% respectively. ")
    bp_five = OpenStruct.new(:type => "code",
      :content => "Pclass_survival <- table(trainData$Survived, trainData$Pclass)
barplot(Pclass_survival, xlab = \"Cabin Class\", ylab = \"Number of People\",
main = \"survived and deceased between male and female\")
Pclass_survival[2] / (Pclass_survival[1] + Pclass_survival[2])
Pclass_survival[4] / (Pclass_survival[3] + Pclass_survival[4])
Pclass_survival[6] / (Pclass_survival[5] + Pclass_survival[6])")
    bp_six = OpenStruct.new(:type => "finish",
      :content => "Thats some decent visualizations for now.
Think about what else you might want to visualize?
The key idea is that we're trying to determine if any/which of our variables are related to what we're trying to predict: Survived.")

      @payload_hash['bar_plot'] = [bp_one, bp_two, bp_three, bp_four, bp_five, bp_six]

  end

  def visit_badge
    return "trainVizDataScreenBadge"
  end

end
