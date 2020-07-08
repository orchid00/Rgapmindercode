# we need to install a package
# install is done only once
# install.packages("ggplot2")

# after installing we need to call the package using the function 
# library()
library(ggplot2)

#use the function ggplot
# ?gglot
# define what dataset to use, usually a data.frame

ggplot(data = gapminder,
       mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

# exercise
# reuse the code above
# change the labels with labs 
# change the theme with theme_dark


a <- ggplot(data = gapminder,
            mapping = aes(x = lifeExp, fill = continent, group = continent)) +
  geom_histogram(bins = 40) +
  facet_wrap(~ continent, ncol = 5) +
  theme_light() +
  theme(legend.position = "none",
        panel.grid.minor =  element_blank())

a

ggsave(filename = "plots/histogramsContinent.png")





