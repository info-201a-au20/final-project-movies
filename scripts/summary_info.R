# Summary Information Script

# To delete all variables in my work space for testing later
rm(list = ls())

# Load libraries
library(lintr)

# A function  that takes in a dataset and returns a list of info about it:
get_summary_info <- function(dataset) {
  ret <- list()
  ret$number_of_obs <- nrow(dataset)
  ret$number_of_columns <- ncol(dataset)
  ret$column_names <- paste(colnames(dataset)[-1], sep = "", collapse = ", ")
  #
  earliest_year_vect <- dataset %>%
    filter(year == min(year)) %>%
    pull(year) #pull gives a vector with all occurrences of the earliest year
  ret$earliest_year <- earliest_year_vect[1]
  #
  latest_year_vect <- dataset %>%
    filter(year == max(year)) %>%
    pull(year)
  ret$latest_year <- latest_year_vect[1]
  return(ret)
}