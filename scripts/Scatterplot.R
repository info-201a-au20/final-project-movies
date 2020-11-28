# Load packages 
library(dplyr)
library(ggplot2)
library(plotly)
library(stringr)

# Creating a scatterplot of different movie genres and corresponding average
# votes over the years
get_scatterplot <- function(dataframe) {
  # TO-DO: split genre column's strings by commas, calculate average vote
  # for each genre per year
  
# TO-DO: REPLACE LOAD CSV FILE WITH FUNCTION TAKING DF AS PARAMETER
# Load csv file
data <- read.csv("./data/midpoint_df.csv", stringsAsFactors = FALSE)

genres_per_year <- function(dataframe) {
  group_by(dataframe, year)
  genres_list <- list(movie_genres = dataframe$genre)
}

# Create new dataframe with movie genres and calculated average vote per year
genre_rating_data <- data %>% # REPLACE DATA WITH DATAFRAME
  group_by(year) %>%
  summarize(
    movie_genre = genres_per_year(data),
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
}

