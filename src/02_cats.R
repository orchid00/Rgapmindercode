# create a data.frame that is called cats
# use the function data.frame
# 3 rows and 3 columns --- 3 observations and variables

cats <- data.frame(coat = c("calico", "black", "tabby"),
                   weight = c(2.1, 5.0, 3.2),
                   likes_string = as.numeric(c(1, 0, 1)))

# save the object cats into the data folder as a csv file named 
# feline-data.csv
write.csv(x = cats,
          file = "data/feline-data.csv",
          row.names = FALSE)

# create a cats data.frame by reading from the csv file
# 
cats <- read.csv(file = "data/feline-data.csv",
                 stringsAsFactors = FALSE)
cats

str(cats)

levels(cats$coat)

# adding a column
# create a new column to add to cats
age <- c(1, 3, 4)
?cbind
cbind(cats, age) # not written to cats

### object <- value
cats <- cbind(cats, age)

# exercise add a new row to the cats data.frame
# results should a 4x4 data.frame
newcat <- list("black", 3.5,1, 4)
cats <- rbind(cats, newcat)
cats

catsf <- read.csv(file = "data/feline-data.csv",
                 stringsAsFactors = TRUE)

newcat <- list("white", 3.5,1, 4)

levels(catsf$coat)
# add a level for coat
levels(catsf$coat) <- c(levels(catsf$coat), "white")
levels(catsf$coat)


catsf

catsf <- rbind(catsf, newcat)
catsf

# deleting rows
# deleting columns
# subseting

# object[ selectrow , selectcolumn ]
cats[1, 1]
# select row 5 from cats and all of the columns

catsf
catsf[5, 1:3]
# shows NA because raw 5 doesn't exist

# what I wanted is to pick row 4
catsf[4, 1:3]

# delete row 3 from the data.frame
# use a - to remove or delete
catsf <- catsf[-3 , ]
# catsf now has rows 1, 2, and 4
catsf

# removing column 3
catsf <- catsf[ , -3 ]
catsf

row.names(catsf)
# trick to rename row.names with consecutive numbers
row.names(catsf) <- NULL
row.names(catsf)


# exercise to work in pairs or threes
# first create a new script called gapminder.R
# save it in the scripts folder
# create a object called gapminder
# use read.csv function to read data/gapminder_data.csv
# show gapminder



