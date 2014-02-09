require_relative "screen"
require_relative "actionScreen"

class DTScreen < ActionScreen
  def initialize(reachable_target, name, points)
    super(reachable_target, name, points)
    @description = "Choose to learn the theory and concepts or if your already familiar you can apply it to our data project."
    @payload_hash = Hash.new
    wiki_one = OpenStruct.new(:type => "explanation",
        :content => "Classification Trees is a popular predictive modeling approach in machine learning and data mining because of its simplicity. It is also easy to visualize the result and express the decisions made.",
        :description => "This Wiki teaches you more details about Classification Trees",
        :action_badge => "DTScreenBadge_Wiki"
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
        :content => "The terminal nodes represent a segment of your data filtered by specific attributes. "
        )
    wiki_eight = OpenStruct.new(:type => "explanation",
        :content => "Terminal nodes can also represent probability estimations if we want to predict the probability\nof membership in that segment. In our Train data lets say we use Sex (Male/Female)\nas the attribute for our first node. "
        )
    wiki_nine = OpenStruct.new(:type => "explanation",
        :content => "Since from our exploratory analysis we know that a much larger percentage of women survived we\ncould make predictions on survival simply from whether an observation was a man or woman. "
        )
    wiki_ten = OpenStruct.new(:type => "explanation",
        :content => "To bolster our tree suppose we chose the second attribute to be age, and specifically, if age\nis less than 18. This is because we hypothesize again the women and children standard. "
        )
    wiki_eleven = OpenStruct.new(:type => "explanation",
        :content => "At the two nodes separating men from women we would now further segment these two groups by\nage. Now we have four terminal nodes: men aged 18 and greater, men aged 18 and less,\nwomen aged 18 and greater, women aged 18 and less. "
        )
    wiki_twelve = OpenStruct.new(:type => "explanation",
        :content => "From here its easy to see that we could increase both the number of nodes and the specificity of the attributes applied to the nodes to make it so each observation results in a\nterminal node and hence a perfect model! "
        )
    wiki_thirteen = OpenStruct.new(:type => "explanation",
        :content => "But wait, because how would this model then apply to a new data set such as Test? It wouldn't\nbe 100% correct and in fact would be significantly worse than a model which\n\"prunes\" certain attributes. "
        )
    wiki_fourteen = OpenStruct.new(:type => "explanation",
        :content => "This is the concept of overfitting that one needs to be conscious of when creating classification trees. "
        )
    wiki_fifteen = OpenStruct.new(:type => "explanation",
        :content => "In general overfitting is when you find patterns in the data (in our case a very very specific\npattern but a pattern nonetheless) that does not generalize to new data.\nDon't worry if this doesn't make sense quite yet. "
        )
    wiki_sixteen = OpenStruct.new(:type => "explanation",
        :content => "The easiest way to understand classification trees is to apply them to a data set. Move onwards\nto start building your first model!"
        )


    apply_one = OpenStruct.new(:type => "explanation",
        :content => "Applying models is quite easy with built in functions and packages you can download that other users have created. Lets first install some packages here:",
        :description => "This Wiki walks you through fitting a classification tree model to your dataset",
        :action_badge => "DTScreenBadge_Apply",
        :requirement => ["trainViewDataScreen_View", "trainVizDataScreenBadge_Viz",
                          "testViewDataScreenBadge_View", "testVizDataScreenBadge_Viz"], #This is the list of badges that you need to enter this payload.
        :lock_description => "[LOCKED]", #The lock screen view, e.g.: [LOCKED] You have to complete cleaning your data! 
        :lock_warn => "You must first view and visualize both data sets!" #Actual message that plays when trying to enter a locked screen "You need to clean your data!
      )
    apply_two = OpenStruct.new(:type => "code",
        :content => "install.packages(\"rpart\")\ninstall.packages(\"rpart.plot\")\nlibrary(rpart)\nlibrary(rpart.plot)"
        )
    apply_three = OpenStruct.new(:type => "explanation",
        :content => "")
    @payload_hash['wiki'] = [wiki_one, wiki_two, wiki_three, wiki_four, wiki_five, wiki_six, wiki_seven, wiki_eight, wiki_nine, wiki_ten, wiki_eleven,wiki_twelve,wiki_thirteen,wiki_fourteen,wiki_fifteen,wiki_sixteen]
    @payload_hash['apply'] = [apply_one]
  end

  def visit_badge
    return "DTScreenBadge"
  end

end
