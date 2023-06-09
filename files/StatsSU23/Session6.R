### SBU Stats Mini-course Review/Practice Session 6 ###


## QUESTIONS ##












## PRACTICE ##



# 1 #
# import the tidyverse library #
library(tidyverse)



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
# imagine we poll 100 people on whether or not the word "sraf" is grammatical #
# what are the probabilities for every possible total "yes" responses? #
# assume there is a 50/50 chance of any one person responding yes #
# use dbinom and save it as p.gram1 #



# 4 #
# plot p.gram1 using the plot() function #
# use type = "h" #



# 5 #
# rather than assume a fixed value for probability = yes, let's assume a prior distribution #
# set seed to 123 #
# draw 100 values from a uniform dist with min=0, max=1 #
# save it as probs1 #



# 6 #
# use dbinom to find the probabilities for every possible total "yes" response #
# but this time set p to probs1 rather than the static value of 0.5 #
# save this a p.gram2 #



# 7 #
# plot p.gram2 using the plot() function #
# use type = "h" #



# 8 #
# rather than assume a fixed value for probability = yes, let's assume a prior distribution #
# set seed to 456 #
# draw 100 values from a uniform dist with min=0.33, max=0.67 #
# save it as probs2 #



# 9 #
# use dbinom to find the probabilities for every possible total "yes" response #
# but this time set p to probs2 rather than the static value of 0.5 #
# save this a p.gram3 #



# 10 #
# plot p.gram2 using the plot() function #
# use type = "h" #



# 11 #
# bayesian inference requires 3 things #
# data, generative model, and priors #
# our generative model is the one from above, with the prior probs2 #
# grammatical = yes ~ binom(100,probs2) #
# probs2 ~ uniform(0.33,0.67) #
# use rbinom and runif to simulate 100000 versions of running this grammaticality experiment #
# save it as results1 #



# 12 #
# use hist() to plot the results #



# 13 #
# make a variable called n_samples with value 100000 #



# 14 #
# make a variable called n_polled with value 100 #



# 15 #
# make a variable called proportion.yes #
# this will be n_samples of a uniform distribution with parameters 0.33,0.67 #
# set seed to 123 #



# 16 #
# make a variable called actual.yes #
# use rbinom #
# this will be n_samples of size n_polled with prob of proportion.yes #



# 17 #
# make a data.frame called prior1 #
# it should have two columns: proportion.yes and actual.yes #



# 18 #
# make a plot of actual.yes vs. proportion yes using plot() #



# 19 #
# make three subsets of data #
# post1 assumes we ran an experiment and 34 people said yes #
# post2 assumes we ran an experiment and 56 people said yes #
# post3 assumes we ran an experiment and 78 people said yes #
# use dplyr and filter to create these data frames #



# 20 #
# for post 1, find the median and 95% credible interval for proportion.yes #
# plot a histogram with a solid red line for median and dashed red lines for the intervals #
# what can we interpret from this? #



# 21 #
# for post 2, find the median and 95% credible interval for proportion.yes #
# plot a histogram with a solid red line for median and dashed red lines for the intervals #
# what can we interpret from this? #



# 22 #
# for post 3, find the median and 95% credible interval for proportion.yes #
# plot a histogram with a solid red line for median and dashed red lines for the intervals #
# what can we interpret from this? #



# 23 #
# do a bayesian analysis on the h95 duration data #
# our underlying model will be a normal distribution #
# use expand.grid to create a parameter space for the mean and sd #
# call it pars #
# use a normal prior on the mean and uniform prior on the sd #
# add cols mu_prior and sd_prior to pars #
# add col prior which is mu_prior * sd_prior #
# make the actual dur data discrete and save as vector durs #
# use the code below to calculate the probabilities based on the data #
# finally, use ggplot to visualize the posterior distribution #
# use geom_point where x and y are mu and sigma, color by probability #
# what can we take away from this?

for(i in 1:nrow(pars)){    
  likelihoods <- dnorm(dur, pars$mu[i], pars$sigma[i])    
  pars$likelihood[i]<- prod(likelihoods)
}

pars$probability <- pars$likelihood * pars$prior
pars$probability <- pars$probability /sum(pars$probability)

