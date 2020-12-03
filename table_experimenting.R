# Source file in scripts
source("./scripts/summary_table_function.R")

# Get data
data <- read.csv("./data/midpoint_df.csv", stringsAsFactors = F)

# Filter data so it only includes genre and year info
table <- summary_table(data) %>%
  select(year, common_genre, least_genre)

# Function for finding years where genre is most and least common
genre_years <- function(genre) {
  
  # Filter for years where genre(s) selected were the least common
  least_common <- table %>%
    filter(least_genre == genre) %>%
    select(year) %>%
    rename(least_years = year) %>%
    as.list()
  
  # Filter for years where genre(s) selected were the most common
  most_common <- table %>%
    filter(common_genre == genre) %>%
    select(year) %>%
    rename(most_years = year) %>%
    as.list()
  
  # Combine lists
  result <- c(least_common, most_common)
  return(result)
}
