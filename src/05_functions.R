# concept function ----
# the structure of a function is

nameoffunction <- function(){
  # tell the function what to do here, 
  # this is the body of the function
}

# sometimes functions receive arguments as you have 
# seen those get names inside the round brackets
# in this example the argument is named x
# and it is printed when calling this function
nameoffunction <- function(x){
  # tell the function what to do here, 
  # this is the body of the function
  print(x)
}
# to call the function write the name of the function
# fill in the argument with a value
nameoffunction(x = "banana")


#you can add more than one argument
# and each might be of different data types

# Exercise function 1 ----
# having the gapminder data.frame 
# write a function called mylineplot
# create a line plot using columns 5 and 6 for x and y 


mylineplot <- function(mydata){
  p <- ggplot(data = mydata) +
    geom_line(aes(x = mydata[ , 5], 
                  y = mydata[ , 6]))
  print(p)
}
# run the function result
mylineplot(mydata = gapminder)

# Exercise function 2 ----
# same as before
# having the gapminder data.frame 
# write a function called mylineplot
# create a line plot using columns 5 and 6 for x and y 
# instead of showing the plot save it using ggsave
# save the plot as .png into the plots folder -- 
# make sure you create the folder before hand

mylineplot <- function(mydata){
  p <- ggplot(data = mydata) +
    geom_line(aes(x = mydata[ , 5], 
                  y = mydata[ , 6]))
  ggsave(filename = "plots/mylineplot.png", plot = p)
}
# run the function result
mylineplot(mydata = gapminder)

# you might then customize your plot
# change the labels with labs
# change the theme
# add colours to the lines

# Exercise function 3 OPTIONAL for intermediates ----
# write a function called mylineplot
# let's now use a data.frame as parameter data
# for this exercise you will use the gapminder
# Optional -- intermediate level
# number 5 as parameter x
# number 6 as parameter y
# in the body of the function you will 
# 1. create a line plot using columns 5 and 6 for x and y 
# 5 and 6 because they are numeric 
# (so bonus points if you are able to reuse this function 
# with another data.frame and other numeric columns)
# then save the plot using ggsave into the plots folder
mylineplot <- function(mydata, x, y){
  p <- ggplot(data = mydata) +
    geom_line(aes(x = mydata[ , x], 
                  y = mydata[ , y]))
  ggsave(filename = "plots/mylineplot_intermediate.png", plot = p)
}
# run the function result
mylineplot(mydata = gapminder, x = 5, y = 6)

