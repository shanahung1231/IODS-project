#Wenhsuan Hung, week5
human <- read.csv("/Users/shanahung/Desktop/IODS-project/human.csv", sep=",", header=TRUE)
# delete first column (which are the numbers of the rows)
library(dplyr)
library(corrplot)
human$X <- NULL
str(human)
dim(human)
#human data includes 195 observations and 19 variables. The variables are:
#Country,HDI.R(HDI.Rank), HDI, LEB(Life.Expectancy.at.Birth), eduY(Expected.Years.of.Education), 
#MYE(Mean.Years.of.Education), GNI(Gross.National.Income..GNI..per.Capita), GNI.HDI(GNI.per.Capita.Rank.Minus.HDI.Rank),
#GII.Rank, GII(Gender.Inequality.Index), MMR(Maternal.Mortality.Ratio), ABR(Adolescent.Birth.Rate), 
#PRP(Percent.Representation.in.Parliament), edu2F(Population.with.Secondary.Education..Female), edu2M(Population.with.Secondary.Education..Male.), 
#labF(Labour.Force.Participation.Rate..Female), labM(Labour.Force.Participation.Rate..Male)     

#transform GNI variable to numeric
str_replace(human$GNI, pattern=",", replace ="") %>% as.numeric

#Exclude unneeded variables
human <- select(human, "Country", "ratio_edu", "ratio_lab", "eduY", "LEB", "GNI", "MMR", "ABR", "PRP")

#Remove all rows with missing values
complete.cases(human)
# print out the data along with a completeness indicator as the last column
data.frame(human[-1], comp = complete.cases(human))
# filter out all rows with NA values
human_ <- filter(human, complete.cases(human))

# last indice we want to keep
last <- nrow(human_) - 7

# choose everything until the last 7 observations
human_new <- human_[1:last, ]

# add countries as rownames
rownames(human_new) <- human_new$Country

# remove the Country variable
human_new <- select(human_new, -Country)

write.csv(human_new, file = "human_week5.csv")
read.csv("human_week5.csv", sep="\t", header=TRUE)
