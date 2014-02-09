require_relative "screen"
require_relative "actionScreen"

class TrainManipDataScreen < ActionScreen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @payload_hash = Hash.new
    @description = "Here's where we get our hands dirty.
Cleaning the data involves making inferences on any missing values as well as converting
the categorical variables to dummary variables. Adding variables involves creating additional
variables which strengthen the predictability of our models."

    clean_one = OpenStruct.new(:type => "header",
    		:content => "To clean the Train data we will first make inferences on any missing values in the dataset.
If you enter the following: trainData$Age you will see that there are
a lot of NA's meaning the age variable is missing for these observations.
\n What we will do is simply calculate the average age of all of the passengers
and use that as a proxy for any missing age variable for an observation!
Then we will write a loop which checks through the Train dataset if the age value is missing,
and if it is substitute the proxy value.",
    		:description => "Clean your training data!",
        :action_badge => "trainManipDataScreenBadge_Manip",
        :requirement => ["trainViewDataScreenBadge_View", "trainVizDataScreenBadge_Viz"], #This is the list of badges that you need to enter this payload.
        :lock_description => "[LOCKED] First view and vizualize the train data.", #The lock screen view, e.g.: [LOCKED] You have to complete cleaning your data!
        :lock_warn => "Must have viewed & visualized data (Whoa there, have you viewed and visualized the data yet?)") #Actual message that plays when trying to enter a locked screen "You need to clean your data!
    clean_two = OpenStruct.new(:type => "code",
      :content => "mean_age <- mean(trainData$Age,na.rm=T)
for (i in 1:nrow(trainData)) {
  if (is.na(trainData[i,5])) {
    trainData$Age[i] <- mean_age
  }
}")
    clean_three = OpenStruct.new(:type => "explanation",
      :content => "We also want to turn the Sex variable (male/female) into a dummy variable (0/1)
so that it can be used in our model and get rid of the columns of the dataset we don't use for our analysis.")
    clean_four = OpenStruct.new(:type => "code",
      :content => "trainData$Sex <- gsub(\"female\", 1, trainData$Sex)
trainData$Sex <- gsub(\"^male\", 0, trainData$Sex)
trainData <- trainData[-c(1,9:12)]")
    clean_five = OpenStruct.new(:type => "finish",
      :content => "Now our Train dataset is clean! Go forth and do analysis")

    @payload_hash['clean'] = [clean_one, clean_two, clean_three, clean_four, clean_five]

    add_var_one  = OpenStruct.new(:type => "header",
        :content => "By creating new variables we may be able to predict the survival of the passengers even more closely.
This tutorial specifically includes three variables which we found improved our model the most.
But you can probably brainstorm better ones if you wanted.",
        :description => "Add new variables to your training data!",
        :action_badge => "trainManipDataScreenBadge_AddVar",
        :requirement => ["GLMScreenBadge_Apply", "DTScreenBadge_Apply"], #This is the list of badges that you need to enter this payload.
        :lock_description => "[LOCKED] First build a simple GLM model and a simple Decision Tree Model in Tool.", #The lock screen view, e.g.: [LOCKED] You have to complete cleaning your data!
        :lock_warn => "Must have applied GLM or Random Forest first AND variables added to Test! (Whoa there, you want to add variables to what?)") #Actual message that plays when trying to enter a locked screen "You need to clean your data!
    add_var_two = OpenStruct.new(:type => "explanation",
      :content => "This additional variable choice stems from the fact that we suspect that being
a child might affect the survival rate of a passanger. We start by creating a child variable.
This is done by appending an empty column to the dataset, titled \"Child\".
We then populate the column with value \"1\", if the passenger is under the age of 12, and \"2\" otherwie.")
    add_var_three = OpenStruct.new(:type => "code",
      :content => "trainData[\"Child\"] <- NA
for (i in 1:nrow(trainData)) {
  if (trainData$Age[i] <= 12) {
    trainData$Child[i] <- 1
  } else {
    trainData$Child[i] <- 2
  }
}")
    add_var_four = OpenStruct.new(:type => "explanation",
      :content => "This variable is meant to represent the family size of each passenger by
adding the number of Siblings/Spouses and Parents/Children and one.
Our hypothesis is that larger families were less likely to survive.")
    add_var_five = OpenStruct.new(:type => "code",
      :content => "trainData[\"Family\"] <- NA
for(i in 1:nrow(trainData)) {
    x <- trainData$SibSp[i]
    y <- trainData$Parch[i]
    trainData$Family[i] <- x + y + 1
}")
    add_var_six = OpenStruct.new(:type => "explanation",
      :content => "We add another variable indicating whether the passenger is a mother.
This is done by going through the passengers and checking to see if the title is Mrs and if the number of kids is greater than 0.")
    add_var_seven = OpenStruct.new(:type => "code",
      :content => "trainData[\"Mother\"] <- NA
for(i in 1:nrow(trainData)) {
    if(trainData$Name[i] == \"Mrs\" & trainData$Parch[i] > 0) {
      trainData$Mother[i] <- 1
    } else {
      trainData$Mother[i] <- 2
    }
}")
    add_var_eight = OpenStruct.new(:type => "finish",
      :content => "That's all the variables we could think of!")

  @payload_hash['add_var'] = [add_var_one, add_var_two, add_var_three, add_var_four, add_var_five, add_var_six, add_var_seven, add_var_eight]

  end

  def visit_badge
    return "trainManipDataScreenBadge"
  end

end
