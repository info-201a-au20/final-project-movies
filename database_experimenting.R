library(dplyr)
library(stringr)

#Roshni's experimental data analysis
imdb_5000_movies_df <- read.csv("data/imdb_5000_movie_dataset.csv",
                                stringsAsFactors = FALSE)
imdb_movies_df <- read.csv("data/IMDb_movies.csv",
                           stringsAsFactors = FALSE)
movies_lionsgate_df <- read.csv("data/movies_lionsgate.csv",
                                stringsAsFactors = FALSE)
movies_metadata_df <- read.csv("data/movies_metadata.csv",
                               stringsAsFactors = FALSE)
# We want to combine the dataframes, using the movie titles as the common factor
# Make sure that all the movie titles are called the same thing -> title
imdb_5000_movies_df <- mutate(imdb_5000_movies_df,
                              "title" = str_sub(
                                movie_title, 1, nchar(movie_title) - 2)
                              )

movies_lionsgate_df <- mutate(movies_lionsgate_df, "title" = name)

imdb_movies_df <- imdb_movies_df %>%
                  select(title, genre, usa_gross_income,
                         budget, language, country, avg_vote,
                         reviews_from_critics, date_published)

imdb_5000_movies_df <- imdb_5000_movies_df %>%
                       select(title, plot_keywords)


# These two datasets have 2584 observations in common
movie_big1_df <- inner_join(imdb_5000_movies_df, imdb_movies_df, by = "title")

movie_big1_df <- movie_big1_df %>%
                 mutate("year" = format(
                   as.Date(date_published, "%Y-%m-%d"), "%Y"
                   )) %>%
                 filter(usa_gross_income != "", year >= 1990) %>%
                 mutate("title_and_year" = paste0(title, " (", year, ")")) %>%
                 select(-title)
write.csv(movie_big1_df, "data/midpoint_df.csv")
