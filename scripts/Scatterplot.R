# Load packages 
library(dplyr)
library(ggplot2)
library(plotly)
library(stringr)
library(tidyr)


# Creating a scatterplot of different movie genres and corresponding average
# votes over the years
get_scatterplot <- function(dataframe) {
  
  data <- dataframe %>%
    select(genre, avg_vote, year) %>%
    separate_rows(genre, sep = ", ")%>%
    group_by(genre, year) %>%
    mutate("average" = sum(avg_vote, na.rm = TRUE)/n()) %>%
    group_by(year)
  
  scatterplot <- ggplot(data = data) + 
    geom_point(mapping = aes(x = year, y = average, color = genre)) +
    ggtitle("Average Vote of Movie Genres by Year") + 
    xlab("Year") +
    ylab("Average vote (out of 10)")  
  
  ggplotly(scatterplot)
  
  return(scatterplot)
}

# FOR TESTING (reduce # of rows of data to process)
#data <- filter(data, year == 1990)

# data <- data %>%
#   select(genre, avg_vote, year) %>%
#   separate_rows(genre, sep = ", ") %>%
#   group_by(genre, year) %>%
#   mutate("genre_avg_vote" = sum(avg_vote, na.rm = TRUE)/n()) %>%
#   unique("genre_avg_vote")
# 
# # separate(data, genre, movie_genres, sep = ", ")
# # select(data, title_and_year, genre, avg_vote) %>%
# #   gather(key = genre, value = avg_vote)
# # 
# # separate(data, genre, )
# # gather(data, key = movie_genre, value = avg_vote, na.rm = TRUE)
# 
# summary_df <- data.frame() # initialize summary_df so it can be accessed outside of for loop
# 
# for (select_year in unique(data$year)) { # loop through every (unique) year in dataframe
#   year_df <- filter(data, year == select_year) 
# 
#   movie_genres <- unlist(strsplit(year_df$genre, ", "))
#   movie_genres_table <- table(unlist(strsplit(year_df$genre, ", ")))
#   movie_genres_df <- data.frame(movie_genres_table)
#   sum_avg_votes <- 0
#   list_sum_avg_votes <- list()
#   
#   # Renaming genre column label in movie_genres_table
#   movie_genres_df <- rename(movie_genres_df, "movie_genre" = "Var1")
#   
#   # Loop through movie genres in movie_genres list and create sum variable for each one
#   i <- 1
#   while (i <= movie_genres.length) {
#     list_sum_avg_votes[i] <- movie_genres_df %>%
#       filter()
#       
#   }
#   
#   for (movie_genre in movie_genres) { # loop through every genre in movie_genres column
#     # TO-DO: figure out how to create individual sum variable (int) for each movie genre
#     # Then: if (movie_genre %in% year_df$genre), add avg_vote corresponding to that genre to sum
#     
#     #list_sum_avg_votes
#     
#     # (Current code below doesn't work)
#     #sum_avg_votes <- sum_avg_votes + movie_genres_df$avg_vote
#     #mutate(movie_genres_df, sum_avg_votes = sum_avg_votes)
#   }
#   
#   # Create new dataframe with movie genres and calculated average vote per year
#   summary_df <- movie_genres_df %>%
#     mutate(year = select_year, 
#            sum_avg_votes = 0,
#            avg_genre_vote = sum_avg_votes / Freq)
#            #avg_genre_vote = mean(select(year_df, avg_vote)), na.rm = TRUE)
# }
# 
# # Create scatterplot based on summary_df dataframe 
# scatterplot <- ggplot(data = summmary_df) + # currently getting error that 'summary_df' is not found
#   geom_point(mapping = aes(x = year, y = avg_genre_vote, color = movie_genre)) +
#   ggtitle("Average Vote of Movie Genres by Year") + 
#   xlab("Year") +
#   ylab("Average vote (out of 10)")
#   
# #  return(scatterplot)
# #}


############## PAST VERSIONS OF CODE (ignore)

#for (movie in year_df$title_and_year) { # loop through every movie in year_df
#  movie_genres <- strsplit(year_df$genre, ", ") #year_df %>% 
  #select(genre) %>%
  #strsplit(genre, ", ")
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


# Initializing variables 
#genre_list_per_year <- list()
#vote_sum <- 0
#num_of_genres <- 0

# Function to add genre to a list of genres per year if not already in list
#genres_per_year <- function(genre) {
#  if (!(genre %in% genre_list_per_year)) { # if genre_list_per_year doesn't contain genre
#    genre_list_per_year$genre # add genre to list
#  }
#  return(genre_list_per_year)
#}

