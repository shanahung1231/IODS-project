#read the joined student alcohol consumption data
alc <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/alc.txt", sep = ",",header=TRUE)
str(alc)
summary(alc)

# access the tidyverse libraries tidyr, dplyr, ggplot2
library(tidyr); library(dplyr); library(ggplot2)

# glimpse at the alc data
glimpse(alc)

# use gather() to gather columns into key-value pairs and then glimpse() at the resulting data
gather(alc) %>% glimpse

# draw a bar plot of each variable
gather(alc) %>% ggplot(aes(value)) + facet_wrap("key", scales = "free") + geom_bar()

