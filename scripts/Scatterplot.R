# Load packages
library(dplyr)
library(ggplot2)
library(plotly)
library(tidyr)
library(styler)
library(lintr)
library(stringr)

# Function that accepts a dataframe and returns a scatterplot of different movie
# genres and corresponding average votes over the years based on data from that
# dataframe
get_scatterplot <- function(dataframe) {
  # Manipulate the dataframe to have the distinct movie genres and average vote
  # per genre for each year
  data <- dataframe %>%
    select(genre, avg_vote, year) %>%
    separate_rows(genre, sep = ", ") %>%
    group_by(genre, year) %>%
    mutate("genre_avg_vote" = sum(avg_vote, na.rm = TRUE) / n()) %>%
    group_by(year)

  scatterplot <- ggplot(data = data) +
    geom_point(mapping = aes(x = year, y = genre_avg_vote, color = genre)) +
    ggtitle("Average Vote of Movie Genres by Year (1990 - 2020)") +
    xlab("Year") +
    ylab("Average vote (out of 10)")

  return(scatterplot)
}

# Function that accepts and changes a dataframe to separate and group by movie
# genres
change_df <- function(dataframe) {
  data <- dataframe %>%
    select(genre, avg_vote, year) %>%
    separate_rows(genre, sep = ", ") %>%
    group_by(genre, year) %>%
    mutate("genre_avg_vote" = sum(avg_vote, na.rm = TRUE) / n()) %>%
    group_by(year)

  return(data)
}

# Function that accepts a dataframe and genre and builds a scatterplot of the
# genre's corresponding average votes over the years based on dataframe's data
build_scatterplot <- function(dataframe, genre_input) {
  genre_titles <- paste(genre_input, collapse = " ")
  # Manipulate the dataframe
  data <- dataframe %>%
    select(genre, avg_vote, year) %>%
    separate_rows(genre, sep = ", ") %>%
    group_by(genre, year) %>%
    filter(genre %in% genre_input) %>% # filter dataframe for inputted genre(s)
    mutate("genre_avg_vote" = sum(avg_vote, na.rm = TRUE) / n()) %>%
    group_by(year)

  scatterplot <- ggplotly(
    ggplot(data = data) +
    geom_point(mapping = aes(x = year, y = genre_avg_vote, color = genre)) +
    ggtitle(paste0(
      "Average Vote of ", genre_titles,
      " Genre(s) by Year (1990 - 2020)"
    )) +
    xlab("Year") +
    ylab("Average vote (out of 10)") +
    labs(color = "Genre") +
    geom_vline(xintercept = 1991, linetype = "dotted", color = "white") +
    geom_vline(xintercept = 1997, linetype = "dotted", color = "white") +
    geom_vline(xintercept = 2001, linetype = "dotted", color = "white") +
    geom_vline(xintercept = 2005, linetype = "dotted", color = "white") +
    geom_vline(xintercept = 2008, linetype = "dotted", color = "white") +
    geom_vline(xintercept = 2020, linetype = "dotted", color = "white")
  )

  return(scatterplot)
}
