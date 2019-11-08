# NCEAS training day 4
# Writing and debugging functions in R

# can add a debug or breakpoint by clicking on the lefthand side of the panel.
# This tells R to stop running the code there. Can inspect the environment at that point. 
# Can allow you to change values too. 
a <- 10
b <- 50

# a function called simpleSum that takes x, creates new variable for y and z, returns the sum of x and z
simpleSum <- function(x, y) {
  y = y + 10
  z = y + 20
  return(sum(x, z))
}

# now you have to run the function
# a browser() directive in the middle of a function (or set of code) will stop the code and show you 
# the level you are browsing in. This is only what you would do if you were in R not Rstudio (cause you can 
# use breakpoints in Rstudio) 
# Advanced R OReilly Press

listofsums <- function(n) {
  m <- n*23
  o <- simpleSum(m, 23)
  return(o)
}

# lets try it with some "real data"
data_url <- data_url <- "https://arcticdata.io/metacat/d1/mn/v2/object/urn%3Auuid%3A35ad7624-b159-4e29-a700-0c0770419941"
bg_chem <- read.csv(data_url, stringsAsFactors = F)

salinityCompare <- function(x,y) {
  ifelse(x == y, TRUE, FALSE)
}

salinityCompare(bg_chem$CTD_Salinity, bg_chem$Bottle_Salinity)


