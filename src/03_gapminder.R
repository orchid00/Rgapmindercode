# download the file
#download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/master/data/gapminder_data.csv", 
#              destfile = "data/gapminder_data.csv")


# Read the csv using read.csv and then use str to check the data types
gapminder <- read.csv("data/gapminder_data.csv")

gapminder <- read.csv("data/gapminder_data.csv",
                      stringsAsFactors = TRUE)
str(gapminder)

?head()
?tail()
head(gapminder)
tail(gapminder)
str(gapminder)
# check the size dimensions
dim(gapminder)

# select country column
gapminder$country

#visualise the data.frame
?View
View(gapminder)

# subseting
gapminder$country == "Australia"

# select all the rows that have the name "Australia" in the country
# and all of the rows

gapminder[gapminder$country == "Australia",  ]

# two ways of selecting rows from Australia and columns country and pop
gapminder[gapminder$country == "Australia", c(1, 3) ]
gapminder[gapminder$country == "Australia", c("country", "pop") ]


# Exercise
# from the gapminder data.frame  
# select the rows that are in the year 1952 or 2007 
# Note to use an or you will need this |
# select the columns country, year and pop
# use str to get the summary
# use View to check the results

smallgapminder <- 
gapminder[gapminder$year == 1952 |
          gapminder$year == 2007,
          c("country", "year", "pop")]

str(smallgapminder)
View(smallgapminder)

### select lifeExp
smallgapminder <- 
  gapminder[gapminder$lifeExp > 60  &
              (gapminder$year > 1980 & gapminder$year < 1990) ,
            c("country", "year", "pop", "lifeExp")]

str(smallgapminder)
View(smallgapminder)

write.csv(x = smallgapminder, file = "data/subset.csv",
          row.names = FALSE)


# conditionals
lowPopCountries <- gapminder[gapminder$pop < 10000000, ]
View(lowPopCountries)

# if receives a conditional that returns TRUE or FALSE
# are there any countries with population less than 10000000
# length gives the number of columns
length(lowPopCountries)
# to get the number of rows
nrow(lowPopCountries)

# how to use conditionals
if(nrow(lowPopCountries) > 0 ) {
  # this call the body of the if condition
  print("Yes we have some countries that have pop < 10000000")
  print("You can glimps the first 10 below")
  # storing the 10 first line
  objectsmall <- head(lowPopCountries, 10)
  # to display the 10 lines
  objectsmall
} else {
  print("no we do not have data complaying to the condition")
}


