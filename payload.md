<h2>Description of the text content throughout mvp2</h2>

<h5>MainScreen</h5>
Welcome to your first data project! Here you will learn several tools for data analysis, build models, and do exploratory analysis! This project is taken from Kaggle, a data science competition website. The project is called Titanic: Machine Learning from Disaster.

You are tasked to predict whether a passenger survived the Titanic crash. You are given two datasets (Train & Test) each of which include predictor variables such as Age, Passenger Class, Sex, etc. With these two data sets we will do the following:

1. Create a model which will predict whether a passenger survived using only the Train data set
2. Predict whether the passengers survived in the Test data set based on the model we created

We will do all of our analysis in RStudio which you should have already installed! In RStudio, we must first create a file for us to write in. Open Rstudio and go to File ==> New ==> Rscript. To run what you write in your RScript, enter CONTROL and RETURN at the same time! It should now pop up on the bottom left window labeled "Console". From now on you can run any of our code snippets by copy and pasting it into your own RScript and entering CONTROL and RETURN.

Have fun and Happy Exploring!

<h5>MainScreen -> Data</h5>
This is the data screen. Notice that you are given two datasets! The first thing we want to do is put the datasets you downloaded from Kaggle into RStudio! For Mac users use the following formaWhich one should you look at first?

<h5>MainScreen -> Data -> Train</h5>
You have the following options to work with the Train data:

<h5>MainScreen -> Data -> Train -> View</h5>
Taking a brief look at the data first is always a good move to get yourself familiarized. You can use the following
function to see the first six rows and all the columns of the data.

```R
head(trainData)
```

Now is actually a good time to put the datasets you are working with into R.
