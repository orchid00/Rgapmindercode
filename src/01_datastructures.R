# data.frames ----

cats <- data.frame(coat = c("calico", "black", "tabby"), 
                   weight = c(2.1, 5.0, 3.2), 
                   likes_string = c(1, 0, 1),
                   stringsAsFactors = FALSE)
write.csv(x = cats, file = "data/feline-data.csv", 
          row.names = FALSE)

cats

cats$coat
# version 4 is now character not factor as before
# it means it doest have levels

cats$weight +2

paste("My cat is", cats$coat)

cats$weight + cats$coat
# shows a different error on version 4 because is not a factor
# Error in cats$weight + cats$coat : 
# non-numeric argument to binary operator
# before
# Warning in Ops.factor(cats$weight, cats$coat): '+' 
# not meaningful for factors

cats <- rbind(cats, data.frame("tabby", 2.4, 1))
cats

cats$weight + 2

file.show("data/feline-data_v2.csv")
## different error
# Error in cats$weight + 2 : non-numeric argument to binary operator
# before
## Warning in Ops.factor(cats$weight, 2): '+' not meaningful for factors


# Class data.frame ----
class(cats)
cats

str(cats$weight)

str(cats$likes_string)
# different in version 4
# num [1:3] 1 0 1

cats$likes_string <- as.logical(cats$likes_string)
cats$likes_string


coats <- c('tabby', 'tortoiseshell', 'tortoiseshell', 'black', 'tabby')
coats
CATegories <- factor(coats)
class(CATegories)
str(CATegories)
#Factor w/ 3 levels "black","tabby",..: 2 3 3 1 2
typeof(CATegories)


age <- c(2, 3, 5)
cats
cbind(cats, age)

age <- c(2, 3, 5, 12)
cbind(cats, age)
## Error in data.frame(..., check.names = FALSE) : 
## arguments imply differing number of rows: 3, 4

age <- c(2, 3)
cbind(cats, age)


newRow <- list("tortoiseshell", 3.3, TRUE)
cats1 <- rbind(cats, newRow)
# version 4 all good
# before
# Warning in `[<-.factor`(`*tmp*`, ri, value = "tortoiseshell"): invalid factor
# level, NA generated
cats1
# the name hasn't been added cuz it is a factor
# and that level doesn't exist yet

catsf <- data.frame(coat = factor(c("calico", "black", "tabby")), 
                       weight = c(2.1, 5.0, 3.2), 
                       likes_string = c(1, 0, 1))
write.csv(x = catsf, file = "data/feline-dataf.csv", 
          row.names = FALSE)

catsf

newRow <- list("tortoiseshell", 3.3, TRUE)
cats1 <- rbind(catsf, newRow)
#Warning message:
#In `[<-.factor`(`*tmp*`, ri, value = "tortoiseshell") :
#  invalid factor level, NA generated
cats1


levels(catsf$coat)

levels(catsf$coat)<- c(levels(catsf$coat), "tortoiseshell")
levels(catsf$coat)

cats1 <- rbind(catsf, list("tortoiseshell", 3.3, TRUE, 9))
cats1

my_vector <- vector(length = 3)
my_vector



## remove a row
cats1[-4, ]
rownames(cats)
rownames(cats) <- NULL # resets rownames
cats

download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/master/data/gapminder_data.csv", destfile = "data/gapminder_data.csv")
gapminder <- read.csv("data/gapminder_data.csv", 
                      stringsAsFactors = TRUE)
str(gapminder)

summary(gapminder$country)

gapminder[sample(nrow(gapminder), 1), ]

View(gapminder[names(gapminder) %in% c("country", "pop") ])

gapminder[gapminder$year == 1957,]

#error
gapminder[gapminder$lifeExp > 80]

gapminder[gapminder$lifeExp > 80, ]

#error
gapminder[gapminder$year == 2002 | 2007,]
View(gapminder[gapminder$year == 2002 | gapminder$year == 2007,])

dim(gapminder[gapminder$country == "Australia" |
               gapminder$country == "UK", ])


# conditionals ---
# if ... else
a <- gapminder[gapminder$pop < 1000000, ]
if (length(a) > 0) {
  countriesif <- gapminder[gapminder$pop < 1000000, 1 ]
  print(unique(countriesif))
} else {  # that is, if the condition is false,
  print("no countries with pop less than 1mi")
}

# 25 countries

a <- gapminder[gapminder$pop > 1000000000, ]
if (length(a) > 0) {
  countriesif <- gapminder[gapminder$pop > 1000000000, 1 ]
  print(unique(countriesif))
} else {  # that is, if the condition is false,
  print("no countries with pop more than 1bi")
}
# 2 countries


if(any(gapminder$year == 2020)){
  print("Record(s) for the year 2020 found.")
}


library("ggplot2")
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point()


ggplot(data = gapminder, aes(x=year, y=lifeExp, 
                                       by=continent, 
                                       color=continent)) +
  geom_point(alpha = 0.2) +
  geom_smooth(method = "lm", colour = "gray") +
  coord_flip() +
  facet_wrap(~ continent, ncol = 5) +
  theme_light() +
  theme(legend.position = "none") 


ggplot(data = gapminder) + 
  geom_bar(mapping = aes(x = continent, 
                         fill = continent))

ggplot(data = gapminder, mapping = aes(x=year, y=pop, by=country, color=continent)) +
  geom_line()


ggplot(data = gapminder, mapping = aes(x=year, y=pop, by=country, color=continent)) +
  geom_line() +
  scale_y_continuous(breaks = c(0, 100000000, 200000000, 500000000, 1000000000),
                     labels = c(0, "100 mi", "200 mi", "500 mi", "1 billio"))

ggplot(data = gapminder, mapping = aes(x=year, y=pop, by=country, color=continent)) +
  geom_line() +
  ylim(c(0, 1000000))

ggplot(data = gapminder, 
       mapping = aes(x = lifeExp, fill = continent)) + 
  geom_histogram(bins = 40) + 
  facet_wrap(~ continent)



# Create a data frame with the levels() of continents
#- our faceting variable ~ continent - and the
# median lifeExp
vline_df <- data.frame(continent = levels(gapminder$continent),
                       medians = tapply(X = gapminder$lifeExp, 
                                        INDEX = gapminder$continent,
                                        FUN = median))

a <- ggplot(data = gapminder, 
       mapping = aes(x = lifeExp, fill = continent)) + 
  geom_histogram(bins = 40) +
  geom_vline(data = vline_df, aes(xintercept = medians), linetype = "dashed",
             colour = "red4") +
  facet_wrap(~ continent, ncol = 5) +
  theme_light() +
  theme(legend.position = "none",
        panel.grid.minor =  element_blank()) 

a



