# Summary Information Script

# To delete all variables in my work space for testing later
rm(list = ls())

# Loading libraries

# A function  that takes in a dataset and returns a list of info about it:
get_summary_info <- function(dataset) {
  ret <- list()
  ret$number_of_obs <- nrow(dataset)
  ret$number_of_columns <- ncol(dataset)
  ret$column_names <- colnames(dataset)
  return(ret)
}

# Test
test <- read.csv("data/imdb_5000_movie_dataset.csv", stringsAsFactors = F)

test_summry <- get_summary_info(test)
