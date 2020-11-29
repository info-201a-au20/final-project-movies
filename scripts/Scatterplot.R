# Load packages 
library(dplyr)
library(ggplot2)
library(plotly)
library(stringr)

# TO-DO: REPLACE LOAD CSV FILE WITH FUNCTION TAKING DF AS PARAMETER
# Load csv file
data <- read.csv("./data/midpoint_df.csv", stringsAsFactors = FALSE)

# Creating a scatterplot of different movie genres and corresponding average
# votes over the years
#get_scatterplot <- function(dataframe) {
  
#genres_per_year <- function(dataframe) {
#  group_by(dataframe, year)
#  genres_list <- list(movie_genres = dataframe$genre)
  #genres_list <- c(strsplit(dataframe$genre, ", "))
#}

#genres_per_year <- function(dataframe, year) {
#  group_by(dataframe, year)
  #genres_list <- list(movie_genres = select(dataframe, genre))
#  genres_list <- strsplit(dataframe$genre, ", ")
#}

# Initializing variables 
genre_list_per_year <- list()
vote_sum <- 0
num_of_genres <- 0

# Function to add genre to a list of genres per year if not already in list
genres_per_year <- function(genre) {
  if (!(genre %in% genre_list_per_year)) { # if genre_list_per_year doesn't contain genre
    genre_list_per_year$genre # add genre to list
  }
  return(genre_list_per_year)
}

#table <- table(unlist(strsplit(column, " ")))

# FOR TESTING (reduce # of rows of data to process)
data <- filter(data, year == 1990)

for (select_year in unique(data$year)) { # loop through every (unique) year in dataframe
  #print(year)
  #movie_genres <- strsplit(data$genre, ", ")
  year_df <- filter(data, year == select_year) #%>%
#    summarize(
#      year = year, 
#      movie_genres = strsplit(genre, ", "),
#      avg_genre_vote = mean(avg_vote, na.rm = TRUE)
#      )

  movie_genres <- unlist(strsplit(year_df$genre, ", "))
  movie_genres_table <- table(unlist(strsplit(year_df$genre, ", ")))
  movie_genres_df <- data.frame(movie_genres_table)
  sum_avg_votes <- 0
  
  for (movie_genre in movie_genres) {
    sum_avg_votes <- sum_avg_votes + movie_genres_df$avg_vote
    mutate(movie_genres_df, sum_avg_votes = sum_avg_votes)
  }
  
  new_df <- data.frame(movie_genres_table) #%>%
    #mutate(year = select_year,
           #avg_genre_vote = mean(select(year_df, avg_vote)), na.rm = TRUE)

}
  
  for (movie in year_df$title_and_year) { # loop through every movie in year_df
    movie_genres <- strsplit(year_df$genre, ", ") #year_df %>% 
      #select(genre) %>%
      #strsplit(genre, ", ")
  }

    
    #movie_genres <- unlist(strsplit(year_df$genre, ", "))
    
    for (indiv_genre in movie_genres) {
      
    }
    
    genre_list_per_year <- genres_per_year(year_df$genre)
    vote_sum <- vote_sum + data$avg_vote
    num_of_genres <- num_of_genres + 1
  #}
  
  #movie_genres <- unlist(strsplit(year_df$genre, ", ")) 
  #print(movie_genres)
#  for (indiv_genre in movie_genres) {
    #print(indiv_genre)
#    genre_list_per_year <- genres_per_year(indiv_genre)
#    vote_sum <- vote_sum + data$avg_vote
#    num_of_genres <- num_of_genres + 1
#  }
#}

# Create new dataframe with movie genres and calculated average vote per year
genre_rating_data <- data %>% # REPLACE DATA WITH DATAFRAME
  group_by(year) %>%
  summarize(
    movie_genre = genres_per_year(data, year),
    #movie_genre = strsplit(genre, ", "),
    avg_genre_vote = mean(avg_vote, na.rm = TRUE)
  )


# Create scatterplot based on genre_rating_data dataframe 
#scatterplot <- ggplot(data = genre_rating_data) +
#  geom_point(mapping = aes(x = year, y = avg_vote, color = movie_genre)) +
#  ggtitle("Average Vote of Movie Genres by Year") + 
#  xlab("Year") +
#  ylab("Average vote (out of 10)")
  
#  return(scatterplot)
#}

