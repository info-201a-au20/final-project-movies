# load packages
library(dplyr)
library(stringr)

# Function
summary_table <- function(dataframe) {
  dataframe <- dataframe %>%
    mutate(genre = str_remove_all(genre, ",")) %>%
    # Mutate data so income and budget are numbers not characters
    filter(budget != " ") %>%
    mutate(
      usa_gross_income = as.numeric(
        str_remove_all(usa_gross_income, "\\$ ")),
      budget = suppressWarnings(
        as.numeric(str_remove_all(budget, "\\$ "))
      )
    )

  # Create a function to create frequency table for genres
  # Most common genre
  most_freq_genre <- function(column) {
    table <- table(unlist(strsplit(column, " ")))
    value <- names(table)[which.max(table)]
    return(value)
  }

  # Least common genre
  least_freq_genre <- function(column) {
    table <- table(unlist(strsplit(column, " ")))
    value <- names(table)[which.min(table)]
    return(value)
  }

  # Create final summary table
  summary_table <- dataframe %>%
    group_by(year) %>%
    summarise(
      num_movies = n(),
      avg_budget = mean(budget, na.rm = TRUE),
      avg_income = mean(usa_gross_income, na.rm = TRUE),
      common_genre = most_freq_genre(genre),
      least_genre = least_freq_genre(genre)
    )
  return(summary_table)
}

# Create column names:
summary_column_names <- c("Year",
                          "Number of Movies Published",
                          "Average Budget",
                          "Average USA Gross Income",
                          "Most Common Genre",
                          "Least Common Genre"
)

# For shiny app:
# Create a function outputting a table on genres
build_genre_table <- function(dataframe) {
  summary_table(dataframe) %>%
    select(year, common_genre, least_genre)
}

# Create a function outputting a table on budget
 build_budget_table <- function(dataframe) {
   data <- summary_table(dataframe) %>%
     select(year, avg_budget) %>%
     filter(!is.na(avg_budget)) %>%
     mutate(avg_budget = format(avg_budget, big.mark = ",", scientific = FALSE))
 } 