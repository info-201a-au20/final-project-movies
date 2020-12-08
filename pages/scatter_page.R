# Scatter Plot page

# Load packages
library(styler)
library(lintr)

# Source files and dataframe
source("./scripts/Scatterplot.R")
data <- read.csv("./data/midpoint_df.csv", stringsAsFactors = F)

# Editing dataframe using change_df function from Scatterplot.R
data <- change_df(data)

# Creating a `sidebarPanel()` for the scatterplot page that contains a
# `selectInput` widget for selecting a movie genre to plot
scatter_sidebar_content <- sidebarPanel(
  checkboxGroupInput(
    inputId = "genre_var",
    label = "Select movie genre(s): ",
    selected = "Action",
    choices = unique(data$genre)
  )
)

# Creating a `mainPanel()` for the scatterplot page that contains the
# `plotlyOutput()` of the scatter
scatter_main_content <- mainPanel(

  plotlyOutput("scatter"),
  tags$h2("About Scatterplot:"),
  tags$p("One of the questions we wanted to consider was the popularity of
         different movie genres over the years, and the above scatterplot
         answers that question by showing the relationship between the average
         IMDB Metascore vote (out of 10) and movie genres in every year
         from 1990 to 2020. The years of significant events we chose to focus on
         are emphasized with dotted white lines on the plot.
         Since most movies in our dataset had multiple genres,
         the average vote for each movie was applied to each of the
         movie's genres. Please note that the scatterplot is interactive, so you
         can hover over each of the data points to see the year, average vote,
         and genre.")
)

# Creating a `tabPanel()` for the scatterplot page
scatter_page <- tabPanel(
  "Genre Popularity",
  fluidPage(
    includeCSS("styling.css"),
    titlePanel(
      tags$h1("Popularity of Movie Genres From 1990-2020")
    ),
    sidebarLayout(
      scatter_sidebar_content,
      scatter_main_content
    ),
    tags$footer(tags$p(
      "Gisele Fox, Emiri Nishizawa, Melina Perraut, Roshni Srikanth,
    Ha Nhat To: ",
      tags$a(id = "url",
             href = "https://github.com/info-201a-au20/final-project-movies",
             "Github URL"))
    )
  )
)
