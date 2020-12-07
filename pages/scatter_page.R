# Scatter Plot page

# List of genres
# Get data
#data <- read.csv("./data/midpoint_df.csv", stringsAsFactors = F)
# # Filter, split multiple genres into individual genres and find unique genres
# genre_list <- data %>%
#   select(genre) %>%
#   separate_rows(genre, sep = ", ") %>%
#   unique() %>%
#   as.list()
# 
# # checkboxGroupInput for selecting genres
# genre_checkbox <- checkboxGroupInput(
#   inputId = "genre",
#   label = "Genre",
#   choices = genre_list,
#   selected = genre_list
# )

##########
source("./scripts/Scatterplot.R")
data <- read.csv("./data/midpoint_df.csv", stringsAsFactors = F)
data <- change_df(data)

# Creating a `sidebarPanel()` for the scatterplot page that contains a
# `selectInput` widget for selecting a movie genre to plot
scatter_sidebar_content <- sidebarPanel(
  #selectInput( # starting out with single input, may change to checkboxGroupInput
  checkboxGroupInput(
    inputId = "genre_var",
    label = "Select movie genre(s): ",
    #choices = data$genre,
    selected = "Action",
    choices = unique(data$genre)
  )
)

# Creating a `mainPanel()` for the scatterplot page that contains the
# `plotlyOutput()` of the scatter
scatter_main_content <- mainPanel(
  plotlyOutput("scatter")
)

# Creating a `tabPanel()` for the scatterplot page
scatter_page <- tabPanel(
  "Scatterplot",

  # Adding a titlePanel to your tab
  titlePanel("Popularity of Individual Movie Genres From 1990-2020"),

  # Creating a sidebar layout for this tab (page)
  sidebarLayout(
    scatter_sidebar_content,
    scatter_main_content
  )
)