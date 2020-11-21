library(dplyr)
#Roshni's experimental data analysis
imdb_5000_movies_df <- read.csv("data/imdb_5000_movie_dataset.csv", stringsAsFactors = FALSE)
imdb_movies_df <- read.csv("data/IMDb_movies.csv", stringsAsFactors = FALSE)
movies_lionsgate_df <- read.csv("data/movies_lionsgate.csv", stringsAsFactors = FALSE)
movies_metadata_df <- read.csv("data/movies_metadata.csv", stringsAsFactors = FALSE)
# We want to combine the dataframes, using the movie titles as the common factor 
# First, we need to make sure that all the movie titles are called the same thing -> movie_title

imdb_movies_df <- mutate(imdb_movies_df, "movie_title" = title)
movies_lionsgate_df <- mutate(movies_lionsgate_df, "movie_title" = name)
movies_metadata_df <- mutate(movies_metadata_df, "movie_title" = title)

# Looks like imdb_5000 and imdb_movies don't have any movies in common??
movie_big1_df <- inner_join(imdb_5000_movies_df, imdb_movies_df, by = "movie_title" )

# These two datasets have 7493 movies in common, which might be useful
movie_big2_df <- inner_join(movies_lionsgate_df, movies_metadata_df, by = "movie_title" )

# These three databases have 4996 movies in common, but many of them are repeats due to language.
# We might not be able to even use the imdb_5000_movies dataset
movie_big3_df <- inner_join(imdb_movies_df, movie_big2_df, by = "movie_title")

movie_big3_df_en <- filter(movie_big3_df, language == "English", original_language == "en")
# This still has repeats because the reviews are different

# Looking at the number of unique movie titles, gives us around 1604 movies to work with
n_unique_titles <- length(unique(movie_big3_df_en$movie_title))
