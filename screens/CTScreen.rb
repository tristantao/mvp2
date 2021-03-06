require_relative "screen"
require_relative "actionScreen"

class CTScreen < ActionScreen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @description = "Choose to learn the theory and concepts or if your already familiar you can apply it to our data project.\nYou may also want to add variables to your model to increase its effectiveness.\nYou can do this by going to the data screens and going to \"Manipulate the Data\"."
    @payload_hash = Hash.new
    @display_description = "Learn and build a Classification Tree Model here"
    wiki_one = OpenStruct.new(:type => "header",
        :content => "Classification Trees is a popular predictive modeling approach in machine learning and data mining because of its simplicity. It is also easy to visualize the result and express the decisions made.",
        :description => "This Wiki teaches you more details about Classification Trees",
        :action_badge => "CTScreenBadge_Wiki"
        )
    wiki_two = OpenStruct.new(:type => "explanation",
        :content => "The biggest advantage of classification trees is that there is very little preparation that\nmust be done to the data. Other techniques require categorical variables to be converted\nand missing values inferenced. Classification trees are also effective on large data sets. "
        )
    wiki_three = OpenStruct.new(:type => "explanation",
        :content => "The biggest disadvantage of classification trees is the problem of overfitting. Mechanisms\nto avoid this must be applied so that overfitting does not occur. "
        )
    wiki_four = OpenStruct.new(:type => "finish",
        :content => "The easiest way to understand classification trees is to apply them to a data set. Move onwards\nto start building your first model!"
        )


    apply_one = OpenStruct.new(:type => "header",
        :content => "Applying models is quite easy with built in functions and packages you can download that other users have created. Lets first install some packages here:",
        :description => "This Wiki walks you through fitting a classification tree model to your dataset",
        :action_badge => "CTScreenBadge_Apply",
        :requirement => ["trainViewDataScreenBadge_View", "trainVizDataScreenBadge_Viz",
                          "testViewDataScreenBadge_View", "testVizDataScreenBadge_Viz"], #This is the list of badges that you need to enter this payload.
        :lock_description => "[LOCKED] You must have visualized both datasets first!", #The lock screen view, e.g.: [LOCKED] You have to complete cleaning your data!
        :lock_warn => "You must first view and visualize both data sets!" #Actual message that plays when trying to enter a locked screen "You need to clean your data!
      )
    apply_two = OpenStruct.new(:type => "code",
        :content => "install.packages(\"rpart\")\ninstall.packages(\"rpart.plot\")\nlibrary(rpart)\nlibrary(rpart.plot)"
        )
    apply_three = OpenStruct.new(:type => "explanation",
        :content => "With classification trees, as we previously said, no cleaning of the data needs to be initially done.\nWe can right now take any of the attributes in trainData (the columns) and\nuse them to predict survival. "
        )
    apply_four = OpenStruct.new(:type => "explanation",
        :content => "Lets build our first model by just picking some variables and then visualizing them for easier understanding."
        )
    apply_five = OpenStruct.new(:type => "code",
        :content => "first_rpart <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare, data = trainData, method = \"class\")\nrpart.plot(first_rpart)"
        )
    apply_six = OpenStruct.new(:type => "explanation",
        :content => "As you can see from the plot on the bottom right quadrant of RStudio, at each node there is an attribute which\nsplits the data in two. Then at the terminal nodes is a value for survival. "
        )
    apply_seven = OpenStruct.new(:type => "explanation",
        :content => "To see the predictions our model \"first_rpart\" makes for the survival of each observation in the Train\ndataset, we use the predict() function in RStudio."
        )
    apply_eight = OpenStruct.new(:type => "code",
        :content => "train_pred <- predict(first.rpart,trainData,type=\"class\")\ntrain_pred"
        )
    apply_nine = OpenStruct.new(:type => "explanation",
        :content => "Now that we have predictions for survival using our model on the Train data we can compare our predictions\nwith the actual survival observations that are given for the\nTrain dataset. "
        )
    apply_ten = OpenStruct.new(:type => "explanation",
        :content => "We do this by calculating four numbers:\n(1) the number of observations we correctly predicted as survived\n(2) the number of observations we correctly predicted as died\n(3) the number of observations we predicted survived and in reality died\n(4) the number of observations we predicted died and in reality survived. "
        )
    apply_eleven = OpenStruct.new(:type => "explanation",
        :content => "To do this we create a custom function called ErrorMatrix. Its a little bit complicated so go ahead and\njust copy and paste it into your Rscript."
        )
    apply_twelve = OpenStruct.new(:type => "code",
        :content => "ErrorMatrix <- function (y, yhat)\n{\n  conf <- matrix(0, nrow = 2, ncol = 2)\n  colnames(conf) <- c(0, 1)\n  rownames(conf) <- c(0, 1)\n  a <- sum((!y) & (yhat==0))\n  b <- sum((!y) & (yhat==1))\n  c <- sum((y) & (yhat==0))\n  d <- sum((y) & (yhat==1))\n  conf[1,1] <- a\n  conf[1,2] <- b\n  conf[2,1] <- c\n  conf[2,2] <- d\n  return(conf)\n}\nErrorMatrix(as.integer(trainData$Survived), train_pred)"
        )
    apply_thirteen = OpenStruct.new(:type => "explanation",
        :content => "In our matrix the x-axis represents our predictions and the y-axis represents the actual survival observation. "
        )
    apply_fourteen = OpenStruct.new(:type => "explanation",
        :content => "From the matrix you can see the following:\n515 represents the number of observations we predicted as died and actually died\n34 is the number of observations we predicted as survived and actually died\n107 is the number of obs. we predicted as died but actually survived\n235 is the number of obs. we predicted as survived and actually survived"
        )
    apply_fifteen = OpenStruct.new(:type => "explanation",
        :content => "What this matrix shows is that when evaluating your models you want to minimize the values for the bottom\nleft and top right quadrants respectively as these represent your errors. "
        )
    apply_sixteen = OpenStruct.new(:type => "explanation",
        :content => "You can think of these similarly to Type I and Type II errors if you'd like though they are not exactly the same."
        )
    apply_seventeen = OpenStruct.new(:type => "explanation",
        :content => "Going back to our model lets now make predictions on our Test dataset for submission to Kaggle!"
        )
    apply_eighteen = OpenStruct.new(:type => "code",
        :content => "test_pred <- predict(first_rpart,testData, type = \"class\")\nkaggle_tree_sub <- cbind(PassengerId,test_pred)\ncolnames(kaggle_tree_sub) <- c(\"PassengerId\", \"Survived\")\nwrite.csv(kaggle_tree_sub, file = \"kaggle_tree.csv\", row.names = FALSE)"
        )
    apply_nineteen = OpenStruct.new(:type => "explanation",
        :content => "A file titled \"kaggle_tree\" should now be in the same folder which you saved the original Test and Train datasets.\nUse this file to make a submission on the Kaggle website and see where you rank! "
        )
    apply_twenty = OpenStruct.new(:type => "finish",
        :content => "Note: Make sure the CSV you submit has only two columns: one labeled as “PassengerID” and another labeled\nas “Survived”."
        )

    @payload_hash['wiki'] = [wiki_one, wiki_two, wiki_three, wiki_four]
    @payload_hash['apply'] = [apply_one, apply_two, apply_three, apply_four, apply_five, apply_six, apply_seven, apply_eight, apply_nine, apply_ten, apply_eleven, apply_twelve, apply_thirteen, apply_fourteen, apply_fifteen, apply_sixteen, apply_seventeen, apply_eighteen, apply_nineteen, apply_twenty]
  end

  def visit_badge
    return "CTScreenBadge"
  end

end
