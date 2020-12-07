# Scatter Plot page

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
  "Genre Popularity",
  titlePanel("Popularity of Movie Genres From 1990-2020"),
  sidebarLayout(
    scatter_sidebar_content,
    scatter_main_content
  )
)