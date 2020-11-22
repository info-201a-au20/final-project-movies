library(dplyr)
library(stringr)

#Roshni's experimental data analysis
imdb_5000_movies_df <- read.csv("data/imdb_5000_movie_dataset.csv", stringsAsFactors = FALSE)
imdb_movies_df <- read.csv("data/IMDb_movies.csv", stringsAsFactors = FALSE)
movies_lionsgate_df <- read.csv("data/movies_lionsgate.csv", stringsAsFactors = FALSE)
movies_metadata_df <- read.csv("data/movies_metadata.csv", stringsAsFactors = FALSE)
# We want to combine the dataframes, using the movie titles as the common factor 
# First, we need to make sure that all the movie titles are called the same thing -> title
imdb_5000_movies_df <- mutate(imdb_5000_movies_df, "title" = str_sub(movie_title, 1, nchar(movie_title)-2))
movies_lionsgate_df <- mutate(movies_lionsgate_df, "title" = name)

# These two datasets have 2584 observations in common
movie_big1_df <- left_join(imdb_5000_movies_df, imdb_movies_df, by = "title" )

# These two datasets have 7493 movies in common, which might be useful
movie_big2_df <- left_join(movies_lionsgate_df, movies_metadata_df, by = "title" )

# These three databases have 4996 movies in common, but many of them are repeats
movie_big3_df <- inner_join(movie_big1_df, movie_big2_df, by = "title")


# Looking at the number of unique movie titles, gives us around 3192 movies to work with
n_unique_titles <- length(unique(movie_big3_df$title))
