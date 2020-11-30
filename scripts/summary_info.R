# Summary information for the data set

# To delete all variables in my work space for testing later
rm(list = ls())

# Load libraries
library(lintr)
library(stringr)

# A function  that takes in a dataset and returns a list of info about it:
get_summary_info <- function(dataset) {
  ret <- list()

  # Getting number of rows and columns in the dataset
  ret$number_of_obs <- nrow(dataset)
  ret$number_of_columns <- ncol(dataset)

  # Getting the names of the variables in normal English
  col_name_eng <- lapply(colnames(dataset), function(x) {
    gsub("_", " ", x)
    })
  col_name_eng <- lapply(col_name_eng, str_to_title)
  ret$column_names <- paste(col_name_eng[-1], sep = "", collapse = ", ")

  # Getting the earliest year in the time frame
  earliest_year_vect <- dataset %>%
    filter(year == min(year)) %>%
    pull(year) #pull gives a vector with all occurrences of the earliest year
  ret$earliest_year <- earliest_year_vect[1]

  # Get the latest year in the time frame
  latest_year_vect <- dataset %>%
    filter(year == max(year)) %>%
    pull(year)
  ret$latest_year <- latest_year_vect[1]
  return(ret)
}
