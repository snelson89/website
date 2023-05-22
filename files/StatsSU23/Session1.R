### SBU Stats Mini-course Review/Practice Session 1 ###


## QUESTIONS ##












## PRACTICE ##

# make a numeric variable, a character variable, and logical variable #



# make a vector called my_vec with the numeric values 4, 8, 15, 16, 23, 42 in that order #
# name the vector with the spelled version of each number #
# index the 3 element of the vector #
# index the 2nd through 4 elements of the vector #
# index the value named "forty-two" #
# find the mean of the vector after each element has been squared #



# make a 5x3 matrix containing the numbers 16-30 #
# fill the matrix by row #



# make a vector called pd containing the following names "Henry", "Ron", "Roman", "Kyle", "Constance", and "Casey" #
# make a 3x2 matrix using pd #
# fill the matrix by column #



# import the tidyverse library #
# note: tidyverse contains dplyr, ggplot2, and more all in one #



# import a data set and save it as h95 #
# the function read_csv() is loaded with the tidyverse library #
# data: https://www.scott-nelson.net/data/StatsSU23/h95-ipa.csv #



# use filter() to select: #
#    rows corresponding to the vowel u    #
#    rows where f0 is between 200-300    #
#    rows where the vowel is i and f0 is less than 200    #



# use arrange() to sort the dataframe by: #
#    f2 ascending    #
#    f1 descending   #



# the h95 data set has a column "type" which indicates if the speaker is a boy, girl, man, or woman #
# use mutate to add two new columns: age & sex #
# the ifelse() function and the | operator (which means or) will be helpful here #



# use group_by() and summarize() to find: # 
#     max f0 by type    #
#     mean f1 by vowel    #
#     median f2 by speaker    #
#     minimum f3 by type and vowel    #



# make a scatter plot of all the vowels where x=F2 and y=F1 #
# have the color correspond to the different vowels #
# vowel plots typically have reversed axes. You can do this with: #
#    scale_x_reverse(position="top")    #
#    scale_y_reverse(position="right")    #



# make the same plot, but facet it by both age and sex #
# facet_grid() is like facet_wrap() #
# in the datacamp lesson you learned how to facet a single variable #
# to facet two variables you type facet_grid(var1 ~ var2)



# normalization is used to account for individual variation in vowel formants #
# one type is Lobanov (z-score) normalization #
# the built-in R function scale() does this automatically #
# Use group_by() and mutate() to add speaker normalized f1 and f2 values #
# Once you've done this, replot the previous two plots #



# make boxplots where x = age and y = f0 #
# use facet_grid() and facet by sex #



# make boxplots where x = sex, y = duration, and color = age #
# use facet_wrap() and facet by vowel #



