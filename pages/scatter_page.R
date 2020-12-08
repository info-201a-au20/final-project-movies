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
  plotlyOutput("scatter"), 
  tags$footer(tags$p("Gisele Fox, Emiri Nishizawa, Melina Perraut, Roshni Srikanth, Ha Nhat To: ", 
                     tags$a(id = "url", href= "https://github.com/info-201a-au20/final-project-movies", "Github URL"))
  )
)

# Creating a `tabPanel()` for the scatterplot page
scatter_page <- tabPanel(
  "Genre Popularity",
  includeCSS("styling.css"),
  titlePanel(
    tags$h1("Popularity of Movie Genres From 1990-2020")),
  sidebarLayout(
    scatter_sidebar_content,
    scatter_main_content
  )
)