require_relative "screen"

class MainScreen < Screen

  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @description = "This is the main screen of the tutorial!"
    @payload_hash = Hash.new
    part_one = OpenStruct.new(:type => "header",
    	:content => "Welcome to your first data project! Here you will learn several tools for data analysis, build models,\nand do exploratory analysis! This project is taken from Kaggle, a data science competition website. The project is called\nTitanic: Machine Learning from Disaster.",
    	:description => "Do we need this for main?"
    	)
    part_two = OpenStruct.new(:type => "explanation",
    	:content => "You are tasked to predict whether a passenger survived the Titanic crash. You are given two datasets\n(Train & Test) each of which include predictor variables such as Age, Passenger Class, Sex, etc. With these two data sets\nwe will do the following:"
    	)
    part_three = OpenStruct.new(:type => "explanation",
    	:content => "1. Create a model which will predict whether a passenger survived using only the Train data set\n2. Predict whether the passengers survived in the Test data set based on the model we created "
    	)
    part_four = OpenStruct.new(:type => "explanation",
    	:content => "We will do all of our analysis in RStudio which you should have already installed! In RStudio, we must\nfirst create a file for us to write in. Open Rstudio and go to File ==> New ==> Rscript. To run what you write in your\nRScript, enter CONTROL and RETURN at the same time! "
    	)
    part_five = OpenStruct.new(:type => "explanation",
    	:content => "Try 1+1 It should now pop up on the bottom left window labeled \"Console\". From now on you can run any\nof our code snippets by copy and pasting it into your own RScript and entering CONTROL and RETURN. "
    	)
    part_six = OpenStruct.new(:type => "finish",
    	:content => "Just to let you know this tutorial involves lots of exploring and requires you to do certain parts before\nothers! We wanted to replicate the role of a data analyst as closely as possible. Have fun and Happy Exploring!"
    	)
    @payload_hash['readme'] = [part_one, part_two, part_three, part_four, part_five, part_six]
  end
  def visit_badge
    return "mainScreenBadge"
  end

end
