#Wenhsuan Hung, 6.11.2019, this is create_learning2014.R file
#data includes 183 observations and 60 variables, showing age, attitude, points, gender, are all integers
lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)
lrn14
str(lrn14)

# create column 'attitude' by scaling the column "Attitude"
lrn14$attitude <- lrn14$Attitude / 10

# Access the dplyr library
library(dplyr)

# questions related to deep, surface and strategic learning
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

# select the columns related to deep learning, surface, strategic and create column 'deep', 'surf',  'stra' by averaging
deep_columns <- select(lrn14, one_of(deep_questions))
lrn14$deep <- rowMeans(deep_columns)
surface_columns <- select(lrn14, one_of(surface_questions))
lrn14$surf <- rowMeans(surface_columns)

strategic_columns <- select(lrn14, one_of(strategic_questions))
lrn14$stra <- rowMeans(strategic_columns)
# choose a handful of columns to keep
keep_columns <- c("gender","Age","attitude", "deep", "stra", "surf", "Points")

# select the 'keep_columns' to create a new dataset
learning2014 <- select(lrn14, one_of(keep_columns))

# change the name of the second column
colnames(learning2014)[2] <- "age"

# change the name of "Points" to "points"
colnames(learning2014)[7] <- "points"

# select male students
male_students <- filter(learning2014, gender == "M")

# select rows where points is greater than zero
learning2014 <- filter(learning2014, points > 0)

getwd()
projectWD <- "/Users/shanahung/IODS-project/data"
setwd(projectWD)
getwd()

write.csv(learning2014, file = "learning2014.csv")
read.csv("learning2014.csv", sep="\t", header=TRUE)

