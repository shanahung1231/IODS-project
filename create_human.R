#Wenhsuan Hung, 23.11.2019, this is create_human.R file
hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")
library(dplyr)
str(hd)
str(gii)
dim(hd);dim(gii)
summary(hd)
summary(gii)

names(hd)[which(names(hd) == "HDI.Rank")] <- "HDI.R"
names(hd)[which(names(hd) == "Human.Development.Index..HDI.")] <- "HDI"
names(hd)[which(names(hd) == "Life.Expectancy.at.Birth")] <- "LEB"
names(hd)[which(names(hd) == "Expected.Years.of.Education")] <- "eduY"
names(hd)[which(names(hd) == "Mean.Years.of.Education")] <- "MYE"
names(hd)[which(names(hd) == "Gross.National.Income..GNI..per.Capita")] <- "GNI"
names(hd)[which(names(hd) == "GNI.per.Capita.Rank.Minus.HDI.Rank")] <- "GNI-HDI"
str(hd)

names(gii)[which(names(gii) == "Gender.Inequality.Index..GII.")] <- "GII"
names(gii)[which(names(gii) == "Maternal.Mortality.Ratio")] <- "MMR"
names(gii)[which(names(gii) == "Adolescent.Birth.Rate")] <- "ABR"
names(gii)[which(names(gii) == "Percent.Representation.in.Parliament")] <- "PRP"
names(gii)[which(names(gii) == "Population.with.Secondary.Education..Female.")] <- "edu2F"
names(gii)[which(names(gii) == "Population.with.Secondary.Education..Male.")] <- "edu2M"
names(gii)[which(names(gii) == "Labour.Force.Participation.Rate..Female.")] <- "labF"
names(gii)[which(names(gii) == "Labour.Force.Participation.Rate..Male.")] <- "labM"
str(gii)

gii <-mutate(gii, ratio_edu = edu2F/edu2M)
gii <-mutate(gii, ratio_lab = labF/labM)
gii

human <- merge(hd, gii, by = "Country")
dim(human)
write.csv(human, file = "human.csv")
read.csv("human.csv", sep="\t", header=TRUE)

