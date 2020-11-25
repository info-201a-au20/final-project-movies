# load packages
library(dplyr)
library(stringr)

# load csv
data <- read.csv("midpoint_df.csv", stringsAsFactors = FALSE)

# Mutate data so genre column has no commas
# (for finding most and least common genres later)
data <- data %>%
  mutate(genre = str_remove_all(genre, ",")) %>%
  # Mutate data so income and budget are numbers not characters
  filter(budget != " ") %>%
  mutate(
    usa_gross_income = as.numeric(
      str_remove_all(usa_gross_income, "\\$ ")),
    budget = as.numeric(str_remove_all(budget, "\\$ "))
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
summary_table <- data %>%
  group_by(year) %>%
  summarise(
    num_movies = n(),
    avg_budget = mean(budget, na.rm = TRUE),
    avg_income = mean(usa_gross_income, na.rm = TRUE),
    common_genre = most_freq_genre(genre),
    least_genre = least_freq_genre(genre)
  )

# Create column names:
summary_column_names <- c("Year",
                          "Number of Movies Published",
                          "Average Budget",
                          "Average USA Gross Income",
                          "Most Common Genre",
                          "Least Common Genre"
                          )
