### SBU Stats Mini-course Review/Practice Session 2 ###


## QUESTIONS ##












## PRACTICE ##



# 1 #
# import the tidyverse library #
library(tidyverse)



# 2 #
# today we will use vot data from Morgan Sonderegger #
# run the following code #
vot.data <-read_csv("https://osf.io/cmh3p/download")



# 3 #
# let's explore the data a little bit #
# plot boxplots of vot~phone #



# 4 #
# plot violinplots of vot~phone #
# assign the fill argument to gender #



# 5 #
# get the min, max, and mean for each phone grouped by stress #



# 6 #
# run a linear model predicting vot given phone #
# make it so there is no intercept #
# save it as m1 #
# how do we interpret these results? #



# 7 #
# run a linear model predicting vot given voicing #
# make it so there is no intercept #
# save it as m2 #
# how do we interpret these results? #



# 8 #
# run a linear model predicting vot given voicing #
# make it so there is an intercept #
# save it as m3 #
# how do we interpret these results? #



# 9 #
# run a linear model predicting vot given voicing, stress, and there interaction #
# include an intercept #
# save it as m4 #
# how do we interpret these results? #



# 10 #
# plot vot on the y-axis, voicing on the x-axis, and color by stress #



# 11 #
# run a linear model predicting vot given gender, voicing, stress, log_celex_freq, and place, plus their interactions #
# include an intercept #
# save it as m5 #
# how many parameters will it have? #
# 2 * 2 * 2 * 1 * 6  = 48 #
# how do we interpret these results? #



# 12 #
# AIC is a way to measure fit #
# when comparing *nested* models, a lower AIC = better fit #
# let's do some model comparison #
# use the AIC() function to get the value for m5 #



# 13 #
# run models removing one of the predictors in each model #
# get their AIC values #
# which has the lowest AIC? #



# 14 #
# these models use fixed effects #
# mixed effects are used when there is dependency in the data #
# for example, certain words and participants are double counted! #
# install and import the lme4 package #



# 15 #
# run a linear mixed effect model of vot~voicing with a random intercept for each speaker #
# save it as m11 #
# compare these results to m3 #



# 16 #
# run a linear mixed effect model of vot~voicing with a random intercept for each speaker and for each word #
# save it as m12 #
# compare these results to m3 #



# 17 #
# the following code is from Bodo Winter's Statistics For Lingusits book #
# it creates a random data set to show what mixed-effect modeling is doing #
# Structure of data: #
#    6 participants    #
#    20 items (words)  #
#    unique logfreq per word    #
#    120 duration values based on these parameters + noise #


# step 1 #
# set seed to 666 #



# step 2 #
# create a participant id vector using gl() "generate levels" #



# step 3 #
# create a word item id vector using gl() then rep()



# step 4 #
# create a frequency vector using round(rexp()) #
# lambda = 20; round to 2 digits #
# multiply the random value by 5 #
# repeat this 6 times using rep() #



# step 5 #
# create a tibble #
# name the columns ppt, item, and freq #



# step 6 #
# add a column called int for an intercept value of 300 #



# step 7 #
# we want to include a random intercept by participant #
# randomly generate 6 values from a normal distribution with mean 0 and sd 40 #
# repeat this 20 times each and save it as pp_ints #



# step 8 #
# add this as the column ppt_ints to the tibble #



# step 9 #
# we can also add a random intercept by item #
# first generate 20 values from a normal distribution with mean 0 and sd 20 #
# repeat this 6 times each and save it as item_ints #



# step 10 #
# add this a the column item_ints to the tibble #



# step 11 #
# generate 120 random noise values from a normal distribution with mean 0 and sd 20 #
# assign it to a variable named error #



# step 12 #
# add error to the tibble #



# step 13 #
# everything so far has to do with random effects #
# we still want a fixed effect of frequency #
# assume vowel duration decrease by 5ms for each increase of 1 in log frequency #
# multiply the frequency data column by -5 #
# save this as effect #



# step 14 #
# add effect to the tibble #



# step 15 #
# add a column called dur which is the sum of: #
#    the main intercept #
#    the participant intercept offset #
#    the item intercept offset #
#    the fixed effect of frequency #
#    the error term #



# step 16 #
# in the real world we could only have participant, item, frequency, and duration info #
# so let's make a second tibble with only that info #
# use select() from dplyr



# step 17 #
# use lmer() on this data to model dur~freq with random intercepts for participant and word #
# set REML = FALSE #
# save this is model.dur #



# step 18 #
# call summary on model.dur and compare it to the actual values used to generate the data #
