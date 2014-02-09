require_relative "screen"
require_relative "actionScreen"

class TrainViewDataScreen < ActionScreen

  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @display_description = "View the training data"
    @payload_hash = Hash.new
    view_one  = OpenStruct.new(:type => "header",
      :content => "Here, you learn how to inspect the data. In R,  we utilize the following function to achieve that goal:",
      :description => "This is where you view and explore the data!",
      :action_badge => "trainViewDataScreenBadge_View",
      :requirement => nil, #This is the list of badges that you need to enter this payload.
      :lock_description => nil, #The lock screen view, e.g.: [LOCKED] You have to complete cleaning your data!
      :lock_warn => nil) #Actual message that plays when trying to enter a locked screen "You need to clean your data!
       #Finish the Data Screen actions!"

    view_two = OpenStruct.new(:type => "explanation",
      :content => "Taking a brief look at the data first is always a good move to get yourself familiarized.
The first thing we want to do is put the datasets you downloaded from Kaggle into RStudio!
Write the following code to \"read in\" your data into RStudio:")
    view_three = OpenStruct.new(:type => "code",
      :content => "trainData <- read.csv(\"train.csv\", header = TRUE, stringsAsFactors = FALSE)
testData <- read.csv(\"test.csv\", header = TRUE, stringsAsFactors = FALSE)")
    view_four = OpenStruct.new(:type => "explanation",
      :content => "Now you can use the following function to see the first six rows and all the columns of the data.")
    view_five = OpenStruct.new(:type => "code",
      :content => "head(trainData)")
    view_six = OpenStruct.new(:type => "explanation",
      :content => "You can also just type trainData to print out the entire dataset into RStudio. ")
    view_seven = OpenStruct.new(:type => "reinforce",
      :content => "Take a moment to make sure you understand, what do each of the rows represent?
What do each of the columns represent? The two confusing columns are \"SibSp\" and \"Parch\".
\"SibSp\" is the sum of the sibilings and spouses aboard for that passenger.
\"Parch\" is the sum of the parents and children aboard for that passenger.")
        view_six = OpenStruct.new(:type => "finish",
      :content => "This is all you can do in the view page! Go try something else.")

    @payload_hash['view'] = [view_one, view_two, view_three, view_four, view_five, view_six]



=begin Example if you wanted to add another lesson here
   pie_one = OpenStruct.new(:type => "explnation",
      :content => "We're now going to build a pie chart!",
      :description = "Build a pie chart!")

    @payload_hash['piechart'] = [pie_one, pie_two]
=end
  end

  def visit_badge
    return "trainViewDataScreenBadge"
  end

end
