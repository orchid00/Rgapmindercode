# Download data ---- 

## place/save the data file in the data/ directory.
download.file(url = "https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder_data.csv", 
              destfile = "data/gapminder_data.csv")

# help ----
?"<-"

sessionInfo()

version

# paste ----
paste(c("a","b"), "c")
paste(c("a","b"), "c", sep = ",")
paste(c("a","b"), "c", collapse = "|")
paste(c("a","b"), "c", sep = ",", collapse = "|")
