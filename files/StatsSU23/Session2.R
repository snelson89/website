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
# find the mean of: #
#   f0    #
#   dur    #



# 4 #
# find the count of: #
#    age    #
#    sex    #



# 5 #
# plot a histogram of the f1 data #
# Is the data skewed? If so, in what direction? #
# What does this predict about the difference between median and mean? #



# 6 #
# find the mean and median of f1 #
# does it match the prediction? #



# 7 #
# plot a boxplot of f1 #
# are there outliers? #



# 8 #
# maybe there are outliers because of the difference in age/sex? #
# plot a boxplot of f1 again, but this time facet the data by age and sex #
# are there still outliers?



# 9 #
# let's find out exactly what the thresholds for outliers are for each group #
# first - group the data by age and sex #
# second - summarize for q1, g2(median), and q3 #
# third - mutate three columns: IQR, lower_thresh, and upper_thresh #
# outliers will be any value below lower_thresh or above upper_thresh #
# do the values match what the boxplots show?



# 10 #
# filter the data to remove any outliers #
# you will need to use the NOT operator which is ! #



# 11 #
# find the variance and sd of: #
#    f2    #
#    f3    #



# 12 #
# set the seed to 123 #



# 13 #
# take 5 samples from the h95 data set #
# first, use ungroup(), otherwise it samples 5 from every group #



# 14 #
# make a one column data frame from the unique vowels in the vowel column of h95 #
# use the unique() function to do this #
# take 10 samples with replacement from this data frame #



# 15 #
# model a six-sided die where each value has the following probabilities of occuring: #
#    1 - 0.25    #
#    2 - 0.1     #
#    3 - 0.15    #
#    4 - 0.1     #
#    5 - 0.15    #
#    6 - 0.25    #



# 16 #
# replicate this process 1000 times #
# save it as dice_1000 #
# plot the results as a histogram (make it a dataframe to use ggplot) #



# 17 #
# find the expected value for this die #
# compare this to the mean of dice_1000 #



# 18 #
# consider a continuous uniform distribution from 10 - 20 #
# what is the probability of: #
#    a value less than 13    #
#    a value greater than 17    #
#    a value between 13 and 17    #



# 19 #
# the binomial distribution can be used to describe grammaticality #
# e.g. - 1 = grammatical; 0 = ungrammatical #
# take 100 samples from a binomial distribution modeling a construction where there is 75% chance of being grammatical #



# 20 #
# what is the probability that exactly {40,80,100} out of 100 people will find this construction grammatical?



# 21 #
# what is the probability that: #
#    less than 40 people will find it grammatical    #
#    greater than 80 people will find it grammatical    #
#    between 40 and 80 people will find it grammatical    #



# 22 #
# what is the expected number of people to find it grammatical if you test 100 people?



# 23 #
# plot a histogram of the h95 duration observations #



# 24 #
# find the mean and standard deviation duration observations #
# save them as mean_h95 and sd_h95 #



# 25 #
# use these as arguments in the follow rows to plot a normal distribution over the histogram #
ggplot(h95,aes(x=dur)) + geom_histogram(binwidth = 10) + 
  stat_function(fun=function(x){dnorm(x,mean=mean_h95,sd=sd_h95) * 10 * nrow(h95)},color="red")



# 26 #
# Given a normal distribution with the parameters found above, what is the probability a duration is: #
#    less than 200 ms    #
#    greater than 350 ms    #
#    between 200-350 ms    #



# 27 #
# In the actual duration data, what proportion is:    #
#    less than 200 ms    #
#    greater than 350 ms    #
#    between 200-350 ms    #



# 28 #
# Given a normal distribution with the parameters found above, what is the value in which 66% of values are less than it? #



# 29 #
# How does this compare to the actual duration data?



# 30 #
# randomly generate 10 observations from a poisson distribution with lambda = 10



# 31 #
# find the mean for each of the following number of draws from a poisson(lambda=10) distribution: #
#    100    #
#    1000    #
#    10000    #
#    100000    #



# 32 #
# replicate this process 1000 times each and plot the results #
# run the following line: par(mfrow=c(2,2)) #
# then use the hist() function and plot all 6 plots next to each other #
# run par(mfrow=c(1,1)) when finished
# what do you notice about the sampling distribution of the means? #



# 33 #
# make a scatter plot of f1 given duration #
# add a trendline using geom_smooth() #



# 34 #
# find the correlation between f1 and duration #



# 35 #
# set seed to 456 #
# simulate 100000 coin flips of a fair coin and assign it to a variable A #
# simulate another 100000 coin flips of a coin that lands heads 72% of the time and assign it to a variable B #



# 36 #
# what is the expected solution for the probability of A & B both being 1 (heads) #
# what percentage of the simulated flips were heads for both A & B? #



# 37 # 
# what is the expected solution for the probability of A or B both being 1 (heads) #
# what percentage of the simulated flips were heads for A or B? #



# 38 #
# set seed to 789 #
# Bayes theorem says: P(A|B) = (P(B|A)*P(A))/P(B) #
# A = coin is unbiased #
# B = 35/50 coin flips being heads #
# solve this both with simulation and analyticaly (using dbinom) #
# assume the biased coin shows heads 78% of the time #
# assume even prior probabilities #



# 39 #
# do the same thing, but now assume you're 89% certain beforehand that the coin is unbiased #


