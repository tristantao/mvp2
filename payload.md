<h2>Description of the text content throughout mvp2</h2>

###Notes
Double spaces delimits the content pasted per user typing enter
##User Pre-setup##
1. Download and install Rstudio
2. Sign up for Kaggle, create Kaggle folder and save datasets

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
This is the data screen. Notice that you are given two datasets! The first thing we want to do is put the datasets you downloaded from Kaggle into RStudio! This requires you to set the working directory so RStudio knows where to find the datasets your working with and reading in the files with another function!
<br>
<br>
For Macs write the following:
```R
setwd("/Users/your_user_name/Desktop/kaggle/")
trainData <- read.csv("train.csv", header = TRUE, stringsAsFactors = FALSE)
testData <- read.csv("test.csv", header = TRUE, stringsAsFactors = FALSE)
```
For Windows users write the following:
```R
setwd("C://Users//Folder//Folder//CurrentFolder//")
trainData <- read.csv("train.csv", header = TRUE, stringsAsFactors = FALSE)
testData <- read.csv("test.csv", header = TRUE, stringsAsFactors = FALSE)
```
Which one should you look at first?

<h5>MainScreen -> Data -> Train</h5>
You have the following options to work with the Train data:

<h5>MainScreen -> Data -> Train -> View</h5>
Taking a brief look at the data first is always a good move to get yourself familiarized. You can use the following
function to see the first six rows and all the columns of the data.
<br>
<br>
```R
head(trainData)
```
You can also just input ```trainData``` to print out the entire dataset.
<br>
<br>
Take a moment to make sure you understand, what do each of the rows represent? What do each of the columns represent? The two confusing columns are "SibSp" and "Parch". "SibSp" is the sum of the sibilings and spouses aboard for that passenger. "Parch" is the sum of the parents and children aboard for that passenger.
<br>
<br>
This is all you can do in the view page! Go try something else.

<h5>MainScreen -> Data -> Train -> Visualize</h5>
###### Must have viewed data first
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
######Must have applied GLM or Random Forest first! (Whoa there, you want to add variables to what?)
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




