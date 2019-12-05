BPRS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep=" ", header=TRUE)
RATS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt",sep="", header=TRUE )

library(dplyr)
library(tidyr)

#check the variable names, structures, summaries of the variables
names(BPRS)
dim(BPRS)
names(RATS)
dim(RATS)
summary(BPRS)
summary(RATS)
str(BPRS)
str(RATS)

#BPRS has 40 observations and 11 variables. The variables are "treatment", "subject", 
#"week0", "week1", "week2", "week3", "week4", "week5", "week6", "week7","week8".  
#RATS has 16 observations and 13 variables. The variables are "ID","Group", "WD1", "WD8"  
#"WD15", "WD22", "WD29", "WD36", "WD43", "WD44", "WD50", "WD57", "WD64".

#Convert the categorical variables of both data sets to factors
#BPRS
BPRS$treatment <- factor(BPRS$treatment)
BPRS$subject <- factor(BPRS$subject)
#RATS
RATS$ID <- factor(RATS$ID)
RATS$Group <- factor(RATS$Group)

# Glimpse the data
glimpse(BPRS); glimpse(RATS)

# Convert BPRS to long form(360 observations and 5 variables)
BPRSL <-  BPRS %>% gather(key = weeks, value = bprs, -treatment, -subject)
# Extract the week number
BPRSL <-  BPRSL %>% mutate(week = as.integer(substr(weeks,5,5)))
# Glimpse at the BPRSL data
glimpse(BPRSL)

# Convert RATS data to long form, and extract time 
RATSL <- RATS %>% gather(key = WD, value = Weight, -ID, -Group) %>% mutate(Time = as.integer(substr(WD,3,4))) 
# Glimpse the data
glimpse(RATSL)

dim(BPRSL)
names(BPRSL)
str(BPRSL)
summary(BPRSL)

dim(RATSL)
names(RATSL)
str(RATSL)
summary(RATSL)

BPRSL$weeks

#BPRSL now has 360 observations and 5 variables. The variable are "treatment", 
#"subject", "weeks", "bprs"," week".    
#RTSL now has 176 observations and 5 variables. The variabels are  "ID", "Group", "WD", "Weight", "Time".  
#Long form data combine all the "week", and 'WD' data together, combing then into one column.
. 
#point of the long form data and the crucial difference between the wide and the long
#forms before proceeding the to Analysis exercise. 


