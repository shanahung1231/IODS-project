#read the joined student alcohol consumption data
alc <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/alc.txt", sep = ",",header=TRUE)
str(alc)
summary(alc)

# produce summary statistics by group
alc %>% group_by(sex, high_use) %>% summarise(count = n(), mean_study_time = mean(studytime))

alc %>% group_by(sex, high_use) %>% summarise(count = n(), mean_failures = mean(failures))

# initialize a plot of high_use and G3
g1 <- ggplot(alc, aes(x = high_use, y = goout, col = sex))

# define the plot as a boxplot and draw it
g1 + geom_boxplot() + ggtitle("Student's go out frequency by alcohol consumption and sex")

# initialise a plot of high_use and absences
g2 <- ggplot(alc, aes(x = high_use, y = freetime, col = sex))

# define the plot as a boxplot and draw it
g2 + geom_boxplot() + ggtitle("Student freetime by alcohol consumption and sex")

# find the model with glm()
m <- glm(high_use ~ studytime + failures + goout + freetime, data = alc, family = "binomial")

# print out a summary of the model
summary(m)

# print out the coefficients of the model
coef(m)

# compute odds ratios (OR)
OR <- coef(m) %>% exp
# compute confidence intervals (CI)
CI <- confint(m) %>% exp

# print out the odds ratios with their confidence intervals
cbind(OR, CI)

# access the tidyverse libraries tidyr, dplyr, ggplot2
library(tidyr); library(dplyr); library(ggplot2)

m_new <- glm(high_use ~ failures + goout + freetime, data = alc, family = "binomial")

# predict() the probability of high_use
probabilities <- predict(m_new, type = "response")

# add the predicted probabilities to 'alc'
alc <- mutate(alc, probability = probabilities)

# use the probabilities to make a prediction of high_use
alc <- mutate(alc, prediction = probabilities > 0.5)

# tabulate the target variable versus the predictions
table(high_use = alc$high_use, prediction = probabilities > 0.5)

# define a loss function (average prediction error)
loss_func <- function(class, prob) {
  n_wrong <- abs(class - prob) > 0.5
  mean(n_wrong)
}

# call loss_func to compute the average number of wrong predictions in the (training) data
loss_func(class = alc$high_use, prob = alc$probability)

# define a loss function (average prediction error)
loss_func <- function(class, prob) {
  n_wrong <- abs(class - prob) > 0.5
  mean(n_wrong)
}

# compute the average number of wrong predictions in the (training) data
loss_func(class = alc$high_use, prob = alc$probability)

# K-fold cross-validation
library(boot)
cv <- cv.glm(data = alc, cost = loss_func, glmfit = m, K = 10)

# average number of wrong predictions in the cross validation
cv$delta[1]





# find the model with glm()
m <- glm(high_use ~ studytime + failures + goout + freetime, data = alc, family = "binomial")

# print out a summary of the model
summary(m)

# print out the coefficients of the model
coef(m)

# compute odds ratios (OR)
OR <- coef(m) %>% exp
# compute confidence intervals (CI)
CI <- confint(m) %>% exp

# print out the odds ratios with their confidence intervals
cbind(OR, CI)



