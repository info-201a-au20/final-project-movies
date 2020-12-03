# Scatter Plot page

# List of genres
# Get data
data <- read.csv("./data/midpoint_df.csv", stringsAsFactors = F)
# Filter, split multiple genres into individual genres and find unique genres
genre_list <- data %>%
  select(genre) %>%
  separate_rows(genre, sep = ", ") %>%
  unique() %>%
  as.list()

# checkboxGroupInput for selecting genres
genre_checkbox <- checkboxGroupInput(
  inputId = "genre_selection",
  label = "Genre",
  choices = genre_list,
  selected = genre_list
)