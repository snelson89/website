### SBU Stats Mini-course Review/Practice Session 2 ###


## QUESTIONS ##












## PRACTICE ##



# 1 #
# import the tidyverse library #



# 2 #
# we will use the h95 dataset again #
# run the following lines to import it into your workspace #
h95 <- read_csv("https://www.scott-nelson.net/data/StatsSU23/h95-ipa.csv") %>%
  group_by(speaker) %>% 
  mutate(age = ifelse(type == "b" | type == "g","child","adult"),
         sex = ifelse(type == "b" | type == "m","male","female"),
         zf1 = scale(f1),
         zf2 = scale(f2)) %>% 
  ungroup()


# 3 #
# use slice sample to randomly sample 15 rows from h95 #



# 4 #
# use slice sample to randomly sample 1% of h95 #



# 5 # 
# use base R sample() function to sample 10 f0 values from h95 #



# 6 #
# find the mean f0 of the h95 data set #



# 7 # 
# using slice_head, find the mean of the first 20 data points in h95 #
# this is called "convenience sampling"



# 8 #
# plot f0 for the entire data set using a histogram #
# plot f0 for the first 20 data points using a histogram #
# compare the distributions #



# 9 #
# set the seed to 9 #
# randomly sample 10 rows from h95 #



# 10 #
# sample 10 evenly spaced points from the data set #
#     step 1: add a row id column to h95     #
#     step 2: choose a sample size           #
#     step 3: get the population size        #
#     step 4: determine the interval size    #
#     step 5: make a row_indexes vector      #
#     step 6: use slice(row_indexes)         #



# 11 #
# use proportional sampling to sample by age, taking 10% of each group #
# group, slice sample with prop, ungroup #



# 12 #
# sample 20 values exactly from each age group #



# 13 #
# for sample size = {10,100,1000} #
# replicate getting the sample mean of duration 1000 times each #



# 14 #
# plot each sample using base R hist() #
# run par(mfrow=c(1,3)) beforehand to show all three plots at the same time #
# run par(mfrow=c(1,1)) after to reset to 1 plot being shown #



# 15 #
# get the mean and sd of the sampling distributions #
# how do the means compare to the true means? #
# what happens to the sd as the sample size increases? #



# 16 #
# bootstrapping is a type of sampling with replacement #
# it allows for the simulation of the population distribution #
# take a sample of 500 f0 data points from h95 #
# bootstrap the f0 distribution from this sample 1000 times #



# 17 #
# plot the bootstrap distribution using hist() #



# 18 #
# calculate the sample mean, bootstrap mean, and true population mean (entire data set) #
# how do they compare?



# 19 #
# do the same thing with the sd #
# the sd of the statistic being measure is the standard error #
# population sd equals SE * sqrt(sample size)



# 20 #
# suppose we think the true mean duration value is 250 hz #
# the alternative is that the true mean duration is not equal to 250 hz #
# test this using bootstrapping (n = 2000) #
# set seed to 123 #
# z score is equal to (sample stat - hypothesized value) / SE #
# for a two-sided test use 2 * pnorm(abs(z score),lower.tail = FALSE) #



# 21 #
# t-tests test the difference between the mean of two groups #
# t-statistic determined in the following way #
# num = mean(group 1) - mean(group 2) #
# den = sqrt(var(group 1)/n(group 1) + var(group 2)/n(group 2)) #
# find the t-statistic for f0 in children vs adults #



# 22 #
# use pt to see if there is a significant difference #
# requires a degrees of freedom argument #
# df for t-statistic is n(group 1) + n(group 2) - 2 #



# 23 #
# compare your previous results with the t.test function #



# 24 #
# plot boxplots of f0 by the "type" variable from h95 #



# 25 #
# perform an ANOVA on f0 ~ type in the h95 data #



# 26 #
# perform pairwise t.tests on these variables #
# use p.adjust.method = "bonferroni" #



# 27 #
# test if the proportion of children and adults in the sample is equal #
# z statistic is (hat(p) - hypothesized p) / SE(hat(p)) #
# SE(hat(p)) = sqrt((hyp p * (1- hyp p)) / n) #
# use pnorm() since using a z statistic #



# 28 # 
# test if the proportion of children and adults is the same for both sexes in the data sample #
# hat(p) = (n(group 1) * hat(p)(group 1) + n(group 2) * hat(p)(group 2)) / n(group 1) + n(group 2) #
# SE = sqrt(hat(p) * (1-hat(p))/n(group 1) + hat(p) * (1-hat(p))/n(group 2))
# z stat = (hat(p)(group 1) - hat(p)(group 2)) / SE



# For next time/revisit on your own:     #
#    chi-square test of independence     #
#    assumptions/non-parametric tests    #


