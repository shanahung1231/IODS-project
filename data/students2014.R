
students2014  <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/learning2014.txt", sep=",", header=TRUE)
#data includes 166 observations and 7 variables, showing information about gender(F, M), age/points(int), attitude/deep/stra/ surf(num)
str(students2014) 

# access the GGally and ggplot2 libraries
library(GGally)
library(ggplot2)

# draw a scatter plot matrix of the variables in students2014.
# [-1] excludes the first column (gender)
pairs(students2014[-1], col = students2014$gender)

# create a more advanced plot matrix with ggpairs()
p <- ggpairs(students2014, mapping = aes(col = gender, alpha = 0.3), lower = list(combo = wrap("facethist", bins = 20)))

# draw the plot
p

summary(students2014)
#the distribution of deep, stra, surf, is more concentrated, age is dispersed
#there is a positive correlation between attitude and points (0.43), deep and surf has negative correlation 
#the value of most of the data lies at attitude:2-4, and points:15-30. In genral, Male has higher points than Female 

# create an plot matrix with ggpairs()
ggpairs(students2014, lower = list(combo = wrap("facethist", bins = 20)))

# create a regression model with multiple explanatory variables
my_model2 <- lm(points ~ attitude + deep + stra, data = students2014)

# print out a summary of the model
summary(my_model2)
#p value is 2.521e-08, which is much less than 0.01, attitude + deep + stra is significant to points

# create a regression model with multiple explanatory variables
my_model2 <- lm(points ~ attitude + deep + stra, data = students2014)

# draw diagnostic plots using the plot() function. Choose the plots 1, 2 and 5
par(mfrow = c(2,2))
plot(my_model2, which = c(1,2,5))




