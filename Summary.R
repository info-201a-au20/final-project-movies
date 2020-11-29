# [Ha] Summary Table

# To delete all variables in my work space for testing later
rm(list = ls())

# Libraries
library("dplyr")

# Load data
imdb_5000_movies_df <- read.csv("data/imdb_5000_movie_dataset.csv", 
                                stringsAsFactors = FALSE)
imdb_movies_df <- read.csv("data/IMDb_movies.csv", stringsAsFactors = FALSE)
streamed_movies <- read.csv("data/MoviesOnStreamingPlatforms_updated.csv", 
                            stringsAsFactors = FALSE)


# Combine imdb movies from imdb_5000_movie_df and imdb_movie_df using title
## Make sure titles are formatted the same and column has the same name "title"
imdb_5000_movies_df$title <- lapply(imdb_5000_movies_df$movie_title, 
                                          function(x) {
                                            gsub("Â", "", x)
                                            })
imdb_5000_movies_df$title <- lapply(imdb_5000_movies_df$title, 
                                          trimws) #trim white space
#(apparently we can use x in funcion(x) as a stand-in for the data in lapply so 
# that it doesn't have to be the first param in the function wanting to vectorize)
imdb_movies_df$title <- lapply(imdb_movies_df$title, trimws)
#
## Filter for information
US_imdb_5000_df <- imdb_5000_movies_df %>%
  filter(country == "USA") %>%
  select(title, genres, title_year, plot_keywords, gross, budget, imdb_score)
#
US_imdb_df <- imdb_movies_df %>%
  filter(sapply(country, str_detect, "USA")) %>%
  select(title, year, date_published, country, avg_vote, reviews_from_critics)
#
## Joining two data sets by title
big_US_imdb_df <- inner_join(US_imdb_5000_df, US_imdb_df, by = "title")
big_imdb_df <- inner_join(imdb_5000_movies_df, imdb_movies_df, by = "title")

#-------------------------------------------------------------------------------

# 1. The least popular genre

#-------------------------------------------------------------------------------

# 2. The most popular genre

#-------------------------------------------------------------------------------

# 3. Average box office earnings

#-------------------------------------------------------------------------------

# 4. NUmber of movies released in theater

#-------------------------------------------------------------------------------
# 5. Number of movies released on streaming services (Netflix, Hulu, 
#    Prime Video, Disney+) - up to May 2020
## Results in a df that can later be added into summary table
streamed_movies_by_year <- streamed_movies %>%
  filter(Year >= 1990) %>%
  filter(sapply(Country, str_detect, "United States")) %>%
  group_by(Year) %>%
  summarise(Movies_streamed_count = n())
