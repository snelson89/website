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
# linear models are generalizations of the equation y = mx + b #
#    y = response/dependent variable    #
#    x = explanatory/independent variable    #
#    m = slope    #
#    b = intercept    #
# we will create some data to show how these work #
# Step 1: set seed to 34 #
# Step 2: generate 100 x values from a normal distribution with mean 5 and sd 12 #
# Step 3: generate a random slope value from the exponential with rate 12 #
# Step 4: generate a random intercept value from a uniform distribution with a minimum of -100 and maximum of 100 #
# Step 5: determine the y values using the equation from above #
# Step 6: generate 100 random values of "noise" from a standard normal distribution and add them to y #



# 4 #
# plot x and y on a scatterplot #
# add a linear trend line #
# add the true line using geom_abline and the slope/intercept values from above #



# 5 #
# use the lm function to model these data #
# save it to a variable m1 #
# call that model #
# call summary on that model #



# 6 # 
# use the code from above to plot everything again #
# this time use geom_abline to add a yellow dashed line with the parameters from m1 #




# 7 #
# let's do this all again, but this time using a categorical x #
# Step 1: set seed to 884 #
# Step 2: generate 100 x values from a binomial distribution with size 1 and probability 0.63 #
# Step 3: generate a random slope value from the exponential with rate 9 #
# Step 4: generate a random intercept value from a uniform distribution with a minimum of 1000 and maximum of 2000 #
# Step 5: determine the y values using the equation from above #
# Step 6: generate 100 random values of "noise" from a standard normal distribution and add them to y #




# 8 #
# plot x and y on a scatterplot #
# add a linear trend line #
# add the true line using geom_abline and the slope/intercept values from above #



# 9 #
# use the lm function to model these data #
# make sure the model has no intercept #
# save it to a variable m2 #
# call that model #
# call summary on that model #



# 10 # 
# use the code from above to plot everything again #
# this time use geom_abline to add a yellow dashed line with the parameters from m2 #



# 11 #
# get the mean of y when x=0 #
# get the mean of y when x=1 #
# how do these compare to the model parameters? #



# 12 #
# using the h95 data set, plot the f0 data as a violin plot #
# add a boxplot with width = 0.1 #
# use theme_classic() #
# remove the axis title text and tick marks: theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank()) #
# use geom_jitter with alpha = 0.2 to show the individual points #



# 13 #
# make a linear model with only an intercept for f0 #
# save it as m3 #
# plot the data using geom_jitter #
# add a red line for the mean using geom_hline #
# add a dashed blue line for the model paramter using geom_hline #



# 14 #
# make a linear model with only duration as a predictor of f0 with no intercept #
# save it as m4 #
# plot a scatter plot of f0 ~ duration #
# use geom_abline to plot the model prediction in red #



# 15 #
# make a linear model with duration as a predictor of f0 WITH an intercept
# save it as m5 #
# plot a scatter plot of f0 ~ duration #
# use geom_abline to plot the model prediction in red #



# 16 #
# make a linear model with age as a predictor of f0 with no intercept #
# save it as m6 #
# use geom_jitter to plot f0 ~ age and set color equal to sex #
# use this code to plot the model stat_summary(geom = "line", fun = mean, group = 1,color="red") #



# 17 #
# make a linear model with zf1 and duration as predictors for f0 with intercept #
# save it as m7 #
# install/load the package gridExtra #
# save two plots as p1 and p2 #
#    each plot should be a scatter plot with y=f0 and x equal to {zf1,duration}    #
#    each plot should contain a red line with the predicted value from the model along that dimension #
# call both plots together using grid.arrange() #



# 18 #
# plot m7 where the predictor variables are the x and y values and color is the response variable #



# 19 #
# make a linear model with age and sex as predictors for f0 with intercept #
# save it as m8 #
# follow the same procedure as above but use geom_jitter #
# also use this code so the line shows up correctly: scale_x_continuous(breaks=c(0,1),labels=c({"female","adult"},{"male","child"})) #
# save the plots as p3 and p4 #
# note to Scott: might need to use as.numeric(as.factor()) in aes call #



# 20 #
# make a linear model with age and dur as predictors for f0 with intercept #
# plot a scatterplot where x=dur, y=f0, color = age #
# use geom_abline to plot the model predictions #
# use the colors defined below in the geom_abline calls #
col1 <- "#00BFC4"
col2 <- "#F8766D"
  


# 21 #
# make a linear model with age and dur AND their interaction as predictors for f0 with intercept #
# plot a scatterplot where x=dur, y=f0, color = age #
# use geom_abline to plot the model predictions #
# use the colors defined above in the geom_abline calls #



# 22 #
# use logistic regression to model sex given f0 #
# using as.factor on the sex variable #


# 23 #
# use the model to predict the probabilities for a given point #
# step 1: make a data.frame where f0 is sequence from the real data set minimum to its maximum with 2000 points #
# step 2: use mutate to add a sex column of predictions using predict with type="response" #



# 24 #
# plot the original data with geom_jitter and height=0.05#
# sex can be plotted with as.numeric(as.factor(sex)) - 1 #
# use geom_line to plot the predicted data and make it red #



# 25 #
# add another column to the original data frame that predicts the sex based on probability #



# 26 #
# plot the original data in the same way, but this time color it based on predicted sex #




