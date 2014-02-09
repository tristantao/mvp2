require_relative "screen"

class MainScreen < Screen

  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @description = "This is the main screen. Choose from the options below:"
    @payload_hash = Hash.new

    puts "Welcome to your first data project! Here you will learn several tools for data analysis, build models,
and do exploratory analysis! This project is taken from Kaggle, a data science competition website.
The project is calledTitanic: Machine Learning from Disaster.\n".green
    sleep(1)
    puts "You are tasked to predict whether a passenger survived the Titanic crash.
You are given two datasets (Train & Test) each of which include predictor variables such as Age,
Passenger Class, Sex, etc. With these two data sets we will do the following:\n".green
    sleep(1)
    puts "1. Create a model which will predict whether a passenger survived using only the Train data set
2. Predict whether the passengers survived in the Test data set based on the model we created\n
Now Let's get started.\n".green
    sleep(1)

  end



  def visit_badge
    return "mainScreenBadge"
  end

end
