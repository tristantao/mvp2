<h2>Description of the text content throughout mvp2</h2>

###Notes
Double spaces delimits the content pasted per user typing enter
##User Pre-setup##
1. Download and install Rstudio
2. Sign up for Kaggle, create Kaggle folder and save datasets
3. Explain how to run Rcode by Ctrl + enter

<h5>MainScreen</h5>
Welcome to your first data project! Here you will learn several tools for data analysis, build models, and do exploratory analysis! This project is taken from Kaggle, a data science competition website. The project is called Titanic: Machine Learning from Disaster.
<br>
<br>
You are tasked to predict whether a passenger survived the Titanic crash. You are given two datasets (Train & Test) each of which include predictor variables such as Age, Passenger Class, Sex, etc. With these two data sets we will do the following:
<br>
<br>
1. Create a model which will predict whether a passenger survived using only the Train data set
2. Predict whether the passengers survived in the Test data set based on the model we created
<br>
<br>
We will do all of our analysis in RStudio which you should have already installed! In RStudio, we must first create a file for us to write in. Open Rstudio and go to File ==> New ==> Rscript. To run what you write in your RScript, enter CONTROL and RETURN at the same time! 
<br>
<br>
Try ```1+1``` It should now pop up on the bottom left window labeled "Console". From now on you can run any of our code snippets by copy and pasting it into your own RScript and entering CONTROL and RETURN.
<br>
<br>
Just to let you know this tutorial involves lots of exploring and requires you to do certain parts before others! We wanted to replicate the role of a data analyst as closely as possible. Have fun and Happy Exploring!

<h5>MainScreen -> Data</h5>
Notice that you are given two datasets! We will use the Train dataset to build our model and then make predictions for the observations in the Test dataset.

<h5>MainScreen -> Data -> Train</h5>
You have the following options to work with the Train data:

<h5>MainScreen -> Data -> Train -> View</h5>
Taking a brief look at the data first is always a good move to get yourself familiarized. The first thing we want to do is put the datasets you downloaded from Kaggle into RStudio! Write the following code to "read in" your data into RStudio:
```R
trainData <- read.csv("train.csv", header = TRUE, stringsAsFactors = FALSE)
testData <- read.csv("test.csv", header = TRUE, stringsAsFactors = FALSE)
```
Now you can use the following function to see the first six rows and all the columns of the data.
```R
head(trainData)
```
You can also just type ```trainData``` to print out the entire dataset into RStudio.
<br>
<br>
Take a moment to make sure you understand, what do each of the rows represent? What do each of the columns represent? The two confusing columns are "SibSp" and "Parch". "SibSp" is the sum of the sibilings and spouses aboard for that passenger. "Parch" is the sum of the parents and children aboard for that passenger.
<br>
<br>
This is all you can do in the view page! Go try something else.

<h5>MainScreen -> Data -> Train -> Visualize</h5>
###### Must have viewed data first (Whoa there, how about we just take a look at the data first?)
Doing visualizations of the data allow you understand it better before you begin any analysis. Which one should you do first?

<h5>MainScreen -> Data -> Train -> Visualize -> DensityPlot</h5>
By first plotting the density we're able to get a sense of how the overall data feel and get a few vague answers: where is the general center? Is there a skew? Does is generally take higher values? Where are most of the values concentrated?
<br>
<br>
```R
plot(density(trainData$Age, na.rm = TRUE))
plot(density(trainData$Fare, na.rm = TRUE))
```
It doesn't hurt to just visualize the data by columns as well. You might notice something fishy...
```R
trainData$Age
```
<h5>MainScreen -> Data -> Train ->Visualize ->BarPlot</h5>
###### Must have done density plot first (Whoa there, lets do a more general visualization first)
Lets now look at the survival rate filtered by sex. Our intuition is that women had a higher chance of surviving because the crewman used teh standard "Women and Childre first" to board the lifeboats. We first create a table and call it counts. Then we use R's barplot() function. We also calculate the male/female survival rates from the table by indexing the table we made called counts. 
<br>
<br>
```R
counts <- table(trainData$Survived, trainData$Sex)
barplot(counts, xlab = "Gender", ylab = "Number of People", main = "survived and deceased between male and female")
counts[2] / (counts[1] + counts[2])
counts[4] / (counts[3] + counts[4])
```
Note that in the barplot you create the lighter areas indicate survival. Doing the calculations below the barplot we see that in our Train data, 74.2% of women survived versus 18.9% of men.
<br>
<br>
Lets now look at the survival rate filtered by passenger class. It seems like the Pclass column might also be informative in survival prediction as the survival rate of the 1st class, 2nd class, and 3rd class are: 63.0%, 47.3%, and 24.2% respectively.
<br>
<br>
```R
Pclass_survival <- table(trainData$Survived, trainData$Pclass)
barplot(Pclass_survival, xlab = "Cabin Class", ylab = "Number of People",
        main = "survived and deceased between male and female")
Pclass_survival[2] / (Pclass_survival[1] + Pclass_survival[2]) 
Pclass_survival[4] / (Pclass_survival[3] + Pclass_survival[4]) 
Pclass_survival[6] / (Pclass_survival[5] + Pclass_survival[6])
```
Thats some decent visualizations for now. Think about what else you might want to visualize? The key idea is that we're trying to determine if any/which of our variables are related to what we're trying to predict: Survived.

<h5>MainScreen -> Data -> Train -> Manipulate</h5>
###### Must have viewed & visualized data (Whoa there, have you viewed and visualized the data yet?)
Here's where we get our hands dirty. Cleaning the data involves making inferences on any missing values as well as converting the categorical variables to dummary variables. Adding variables involves creating additional variables which strengthen the predictability of our models. 

<h5>MainScreen -> Data -> Train -> Manipulate -> Cleaning</h5>
To clean the Train data we will first make inferences on any missing values in the dataset. If you enter the following: ```trainData$Age``` you will see that there are a lot of NA's meaning the age variable is missing for these observations.

What we will do is simply calculate the average age of all of the passengers and use that as a proxy for any missing age variable for an observation! Then we will write a loop which checks through the Train dataset if the age value is missing, and if it is substitute the proxy value.
```R
mean_age <- mean(trainData$Age,na.rm=T)
for (i in 1:nrow(trainData)) {
  if (is.na(trainData[i,5])) {
    trainData$Age[i] <- mean_age
  }
}
```
We also want to turn the Sex variable (male/female) into a dummy variable (0/1) so that it can be used in our model and get rid of the columns of the dataset we don't use for our analysis
```R
trainData$Sex <- gsub("female", 1, trainData$Sex)
trainData$Sex <- gsub("^male", 0, trainData$Sex)
trainData <- trainData[-c(1,9:12)]
```
Now our Train dataset is clean! Go forth and do analysis

<h5>MainScreen -> Data -> Train -> Manipulate -> AddingVar</h5>
######Must have applied GLM or Random Forest first AND variables added to Test! (Whoa there, you want to add variables to what?)
By creating new variables we may be able to predict the survival of the passengers even more closely. This tutorial specifically includes three variables which we found improved our model the most. But you can probably brainstorm better ones if you wanted.
<br>
<br>
This additional variable choice stems from the fact that we suspect that being a child might affect the survival rate of a passanger. We start by creating a child variable. This is done by appending an empty column to the dataset, titled "Child". We then populate the column with value "1", if the passenger is under the age of 12, and "2" otherwie.
```R
trainData["Child"] <- NA

for (i in 1:nrow(trainData)) {
  if (trainData$Age[i] <= 12) {
    trainData$Child[i] <- 1
  } else {
    trainData$Child[i] <- 2
  }
}
```
This variable is meant to represent the family size of each passenger by adding the number of Siblings/Spouses and Parents/Children and one. Our hypothesis is that larger families were less likely to survive.
```R
trainData["Family"] <- NA

for(i in 1:nrow(trainData)) {
    x <- trainData$SibSp[i]
    y <- trainData$Parch[i]
    trainData$Family[i] <- x + y + 1
}
```
We add another variable indicating whether the passenger is a mother. This is done by going through the passengers and checking to see if the title is Mrs and if the number of kids is greater than 0.
```R
trainData["Mother"] <- NA

for(i in 1:nrow(trainData)) {
    if(trainData$Name[i] == "Mrs" & trainData$Parch[i] > 0) {
      trainData$Mother[i] <- 1
    } else {
      trainData$Mother[i] <- 2
    }
}
```
That's all the variables we could think of!

<h5>MainScreen -> Data -> Test</h5>
You have the following options to work with the Test data:

<h5>MainScreen -> Data -> Test -> View</h5>
Here are some additional functions you can use to view data in R:
```R
head(testData)
tail(testData)
testdata
```
<h5>MainScreen -> Data -> Test -> Visualize</h5>
######Must have Train visualize completed (Whoa there, lets do Train first, then Test)
Visualizations of the Test data is also important, mostly to make sure there isn't any funny business going on! You want to make sure that the Train and Test data are similar so that the model you fit using the Train data applies to the data you have given in the Test data.


<h5>MainScreen -> Data -> Test -> Visualize -> PieChartPlot</h5>
We will also teach you how to make another visualization, the pie chart.
```R
pie(table(trainData$Pclass)/length(trainData$Pclass), main = "Train Data: % of each Pclass")
pie(table(testData$Pclass)/length(testData$Pclass), main = "Test Data: % of each Pclass")
```

<h5>MainScreen -> Data -> Test -> Visualize -> DensityPlot</h5>
We also check the density for the Age column to make sure its similar to the Train data
```R
plot(density(trainData$Age, na.rm = TRUE), main ="Train Density")
plot(density(testData$Age,na.rm = T), main = "Test Density")
```
Everything should look good!

<h5>MainScreen -> Data -> Test -> Manipulate</h5>
Same deal as manipulating the Train data. We must clean up the Test dataset so that our model works and add variables to strengthen our model.

<h5>MainScreen -> Data -> Test -> Manipulate -> Cleaning</h5>
Same deal as the Train data. We remove columns we don't use in our analysis, making inferences on the missing age values, and make dummy variables for the Sex column.
```R
testData <- testData[-c(1, 8:11)]
testData$Sex <- gsub("female", 1, testData$Sex)
testData$Sex <- gsub("^male", 0, testData$Sex)
test_mean_age <- mean(testData$Age, na.rm= T)
for (i in 1:nrow(testData)) {
  if (is.na(testData[i,4])) {
    testData[i, 4] <- test_mean_age
  }
}
```

<h5>MainScreen -> Data -> Test -> Manipulate -> AddingVar</h5>
######Must have applied GLM or Random Forest First AND variables must be applied in Train (Whoa there, what do you want to add variables too? Also are you sure you've done this for the Train data as well?)
We've already given you the variables we brainstormed but try to do a few yourself. Just remember to add the variables to BOTH of the datasets! Here's the code for the Test data variables.
```R
testData["Child"] <- NA

for (i in 1:nrow(testData)) {
  if (testData[i, 4] <= 12) {
    testData[i, 7] <- 1
  } else {
    testData[i, 7] <- 2
  }
}

testData["Family"] <- NA

for(i in 1:nrow(testData)) {
  testData[i, 8] <- testData[i, 5] + testData[i, 6] + 1
}

testData["Mother"] <- NA

for(i in 1:nrow(testData)) {
  if(testData[i, 2] == "Mrs" & testData[i, 6] > 0) {
    testData[i, 9] <- 1
  } else {
    testData[i, 9] <- 2
  }
}
```
Finite!

<h5>MainScreen -> Tools</h5>
Welcome to the Tools Screen. There are tons of machine learning tools that can be applied to this data project but we will teach only two.

<h5>MainScreen -> Tools -> ClassificationTrees</h5>
You chose to learn classification trees. Choose to learn the theory and concepts or if your already familiar you can apply it to our data project.

<h5>MainScreen -> Tools -> ClassificationTrees -> Wiki</h5>
Classification Trees is a popular predictive modeling approach in machine learning and data mining because of its simplicity. It is also easy to visualize the result and express the decisions made. 
<br>
<br>
The biggest advantage of classification trees is that there is very little preparation that must be done to the data. Other techniques require categorical variables to be converted and missing values inferenced. Classification trees are also effective on large data sets.
<br>
<br>
The biggest disadvantage of classification trees is the problem of overfitting. Mechanisms to avoid this must be applied so that overfitting does not occur.
<br>
<br>
A tree is made up of interior nodes and terminal nodes and is actually structured upside down so the root node is at the top of the tree and branches downwards from it. At each node of a tree, an attribute from your data is used to segment your data. Attributes along the path to a terminal node give the characteristics of a segment. The terminal nodes represent a segment of your data filtered by specific attributes.
<br>
<br>
Terminal nodes can also represent probability estimations if we want to predict the probability of membership in that segment. In our Train data lets say we use Sex (Male/Female) as the attribute for our first node. Since from our exploratory analysis we know that a much larger percentage of women survived we could make predictions on survival simply from whether an observation was a man or woman.
<br>
<br>
To bolster our tree suppose we chose the second attribute to be age, and specifically, if age is less than 18. This is because we hypothesize again the women and children standard. At the two nodes separating men from women we would now further segment these two groups by age. Now we have four terminal nodes: men aged 18 and greater, men aged 18 and less, women aged 18 and greater, women aged 18 and less.
<br>
<br>
From here its easy to see that we could increase both the number of nodes and the specificity of the attributes applied to the nodes to make it so each observation results in a terminal node and hence a perfect model! But wait, because how would this model then apply to a new data set such as Test? It wouldn't be 100% correct and in fact would be significantly worse than a model which "prunes" certain attributes. This is the concept of overfitting that one needs to be conscious of when creating classification trees.
<br>
<br>
In general overfitting is when you find patterns in the data (in our case a very very specific pattern but a pattern nonetheless) that does not generalize to new data. Don't worry if this doesn't make sense quite yet. The easiest way to understand classification trees is to apply them to a data set. Move onwards to start building your first model!

<h5>MainScreen -> Tools -> ClassificationTrees -> Apply</h5>
###### Add optionality to go to AddVariable screen and Evaluate Screen

Applying models is quite easy with built in functions and packages you can download that other users have created. Lets first install some packages here:

```R
install.packages("rpart")
install.packages("rpart.plot")
library(rpart)
library(rpart.plot)
```
With classification trees, as we previously said, no cleaning of the data needs to be initially done. We can right now take any of the attributes in trainData (the columns) and use them to predict survival. Lets build our first model by just picking some variables and then plotting them for easier understanding.

```R
first_rpart <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare, data = trainData, method = "class")
rpart.plot(first_rpart)
```
As you can see from the plot on the bottom right quadrant of RStudio, at each node there is an attribute which splits the data in two. Then at the terminal nodes is a value for survival. To see the predictions our model "first_rpart" makes for the survival of each observation in the Train dataset, we use the predict() function in RStudio.

```R
train_pred <- predict(first.rpart,trainData,type="class")
train_pred
```
Now that we have predictions for survival using our model on the Train data we can compare our predictions with the actual survival observations that are given for the Train dataset. We do this by calculating four numbers: (1) the number of observations we correctly predicted as survived (2) the number of observations we correctly predicted as died (3) the number of observations we predicted survived and in reality died (4) the number of observations we predicted died and in reality survived.
<br>
<br>
To do this we create a custom function called ErrorMatrix. Its a little bit complicated so go ahead and just copy and paste it into your Rscript.
```R
ErrorMatrix <- function (y, yhat)
{
  conf <- matrix(0, nrow = 2, ncol = 2)
  colnames(conf) <- c(0, 1)
  rownames(conf) <- c(0, 1)
  a <- sum((!y) & (yhat==0))
  b <- sum((!y) & (yhat==1))
  c <- sum((y) & (yhat==0)) 
  d <- sum((y) & (yhat==1))
  conf[1,1] <- a
  conf[1,2] <- b
  conf[2,1] <- c
  conf[2,2] <- d
  return(conf)
}
ErrorMatrix(as.integer(trainData$Survived), train_pred)
```
In our matrix the x-axis represents our predictions and the y-axis represents the actual survival observation. From the matrix you can see that the top left quadrant represents the number of observations we correctly predicted as died, the top right quadrant is the number of observations we incorrectly predicted as survived, and so on.
<br>
<br>
What this matrix shows is that when evaluating your models you want to minimize the values for the bottom left and top right quadrants respectively as these represent your errors. You can think of these similarly to Type I and Type II errors if you'd like though they are not exactly the same.
<br>
<br>
Going back to our model lets now make predictions on our Test dataset for submission to Kaggle!
```R
test_pred <- predict(first_rpart,testData, type = "class")
kaggle_tree_sub <- cbind(PassengerId,test_pred)
colnames(kaggle_tree_sub) <- c("PassengerId", "Survived")
write.csv(kaggle_tree_sub, file = "kaggle_tree.csv", row.names = FALSE)
```
A file titled "kaggle_tree" should now be in the same folder which you saved the original Test and Train datasets. Use this file to make a submission on the Kaggle website and see where you rank!
Note: Make sure the CSV you submit has only two columns: one labeled as “PassengerID” and another labeled as “Survived”.

<h5>MainScreen -> Tools -> Glm</h5>
You chose to learn logistic regression. Choose to learn the theory and concepts or if your already familiar you can apply it to our data project.

<h5>MainScreen -> Tools -> Glm -> Wiki</h5>
A logistic regression model is a generalized linear model which gives you the probability of whether or not an observation is in a group which is typically categorical. Since whether a passenger survived or not is binary, we use logistic regression. Linear regression is applied when the variable you are predicting is continuous. 

<h5>MainScreen -> Tools -> Glm -> Apply</h5>
###### Must have cleaned TEST data and Added Var screens (The logistic regression model cannot be applied before you fully manipulate it!)
The theory of logistic regression is much more complicated mathematically so we will not go into it in this tutorial. R will take care of solving/optimizing the model. The predictions for each observation come in from the model in the form of a probability score for Survived being 0 or 1. Write the following code to build your logistic model:
```R
train.glm <- glm(Survived ~ Pclass + Sex + Age + Child + Sex*Pclass + Family + Mother, family = binomial, data = trainData)
summary(train.glm)
```
We must apply a cutoff value to determine which probability scores translate to a 1 and which translate to a 0. For simplicity it is generally most effective to choose a cutoff of .5 to minimize errors. Write the following code into your Rscript:

```R
p.hats <- predict.glm(train.glm, newdata = testData, type = "response")
 
survival <- vector()
for(i in 1:length(p.hats)) {
  if(p.hats[i] > .5) {
    survival[i] <- 1
  } else {
    survival[i] <- 0
  }
}
```
To finish this up for submission to Kaggle we write the following code:
```R
kaggle_logistic_sub <- cbind(PassengerId,survival)
colnames(kaggle_logistic_sub) <- c("PassengerId", "Survived")
write.csv(kaggle_logistic_sub, file = "kaggle.csv", row.names = FALSE)
```
Again, make sure the CSV you submit has only two columns: one labeled as “PassengerID” and another labeled as “Survived”. Hopefully your score improved!

