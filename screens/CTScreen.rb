require_relative "screen"
require_relative "actionScreen"

class CTScreen < ActionScreen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @description = "Choose to learn the theory and concepts or if your already familiar you can apply it to our data project."
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
    wiki_four = OpenStruct.new(:type => "explanation",
        :content => "A tree is made up of interior nodes and terminal nodes and is actually structured upside down\nso the root node is at the top of the tree and branches downwards from it. "
        )
    wiki_five = OpenStruct.new(:type => "explanation",
        :content => "At each node of a tree, an attribute from your data is used to segment your data. Attributes\nalong the path to a terminal node give the characteristics of a segment. "
        )
    wiki_six = OpenStruct.new(:type => "explanation",
        :content => "The terminal nodes represent a segment of your data filtered by specific attributes. "
        )
    wiki_seven = OpenStruct.new(:type => "explanation",
        :content => "Terminal nodes can also represent probability estimations if we want to predict the probability\nof membership in that segment. In our Train data lets say we use Sex (Male/Female)\nas the attribute for our first node. "
        )
    wiki_eight = OpenStruct.new(:type => "explanation",
        :content => "Since from our exploratory analysis we know that a much larger percentage of women survived we\ncould make predictions on survival simply from whether an observation was a man or woman. "
        )
    wiki_nine = OpenStruct.new(:type => "explanation",
        :content => "To bolster our tree suppose we chose the second attribute to be age, and specifically, if age\nis less than 18. This is because we hypothesize again the women and children standard. "
        )
    wiki_ten = OpenStruct.new(:type => "explanation",
        :content => "At the two nodes separating men from women we would now further segment these two groups by\nage. Now we have four terminal nodes: men aged 18 and greater, men aged 18 and less,\nwomen aged 18 and greater, women aged 18 and less. "
        )
    wiki_eleven = OpenStruct.new(:type => "explanation",
        :content => "From here its easy to see that we could increase both the number of nodes and the specificity\nof the attributes applied to the nodes to make it so each observation results in a\nterminal node and hence a perfect model! "
        )
    wiki_twelve = OpenStruct.new(:type => "explanation",
        :content => "But wait, because how would this model then apply to a new data set such as Test? It wouldn't\nbe 100% correct and in fact would be significantly worse than a model which\n\"prunes\" certain attributes. "
        )
    wiki_thirteen = OpenStruct.new(:type => "explanation",
        :content => "This is the concept of overfitting that one needs to be conscious of when creating classification trees. "
        )
    wiki_fourteen = OpenStruct.new(:type => "explanation",
        :content => "In general overfitting is when you find patterns in the data (in our case a very very specific\npattern but a pattern nonetheless) that does not generalize to new data.\nDon't worry if this doesn't make sense quite yet. "
        )
    wiki_fifteen = OpenStruct.new(:type => "finish",
        :content => "The easiest way to understand classification trees is to apply them to a data set. Move onwards\nto start building your first model!"
        )


    apply_one = OpenStruct.new(:type => "header",
        :content => "Applying models is quite easy with built in functions and packages you can download that other users have created. Lets first install some packages here:",
        :description => "This Wiki walks you through fitting a classification tree model to your dataset",
        :action_badge => "CTScreenBadge_Apply",
        :requirement => ["trainViewDataScreen_View", "trainVizDataScreenBadge_Viz",
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
        :content => "As you can see from the plot on the bottom right quadrant of RStudio, at each node there is an attribute which\nsplits the data in two. Then at the terminal nodes is a value\nfor survival. "
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
        :content => "We do this by calculating four numbers: (1) the number of observations we correctly predicted as survived\n(2) the number of observations we correctly predicted as died (3) the\nnumber of observations we predicted survived and in reality died (4) the number of observations we predicted\ndied and in reality survived. "
        )
    apply_eleven = OpenStruct.new(:type => "explanation",
        :content => "To do this we create a custom function called ErrorMatrix. Its a little bit complicated so go ahead and\njust copy and paste it into your Rscript."
        )
    apply_twelve = OpenStruct.new(:type => "code",
        :content => "ErrorMatrix <- function (y, yhat)\n{\n  conf <- matrix(0, nrow = 2, ncol = 2)\n  colnames(conf) <- c(0, 1)\n  rownames(conf) <- c(0, 1)\n  a <- sum((!y) & (yhat==0))\n  b <- sum((!y) & (yhat==1))\n  c <- sum((y) & (yhat==0))\n  d <- sum((y) & (yhat==1))\n  conf[1,1] <- a\n  conf[1,2] <- b\n  conf[2,1] <- c\n  conf[2,2] <- d\n  return(conf)\n}\nErrorMatrix(as.integer(trainData$Survived), train_pred)"
        )
    apply_thirteen = OpenStruct.new(:type => "explanation",
        :content => "In our matrix the x-axis represents our predictions and the y-axis represents theactual survival observation. "
        )
    apply_fourteen = OpenStruct.new(:type => "explanation",
        :content => "From the matrix you can see that the top left quadrant represents the number of observations we correctly\npredicted as died, the top right quadrant is the number of observations we incorrectly predicted as\nsurvived, and so on. "
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

    @payload_hash['wiki'] = [wiki_one, wiki_two, wiki_three, wiki_four, wiki_five, wiki_six, wiki_seven, wiki_eight, wiki_nine, wiki_ten, wiki_eleven,wiki_twelve,wiki_thirteen,wiki_fourteen,wiki_fifteen]
    @payload_hash['apply'] = [apply_one, apply_two, apply_three, apply_four, apply_five, apply_six, apply_seven, apply_eight, apply_nine, apply_ten, apply_eleven, apply_twelve, apply_thirteen, apply_fourteen, apply_fifteen, apply_sixteen, apply_seventeen, apply_eighteen, apply_nineteen, apply_twenty]
  end

  def visit_badge
    return "CTScreenBadge"
  end

end
