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
         from 1990 to 2020.
         Since most movies in our dataset had multiple genres,
         the average vote for each movie was applied to each of the
         movie's genres.
         The significant events that we looked at were in 1991
         (Introduction of the Internet), 1997 (Creation of Netflix), 2001
         (9/11), 2005 (Creation of Youtube), 2008 (Great Recession), and 2020
         (Coronavirus Pandemic). The years of those significant events
         are emphasized with dotted white lines on the plot.")
)

# Creating a `tabPanel()` for the scatterplot page
scatter_page <- tabPanel(
  "Genre Popularity",
  fluidPage(
    includeCSS("styling.css"),
    titlePanel(
      tags$h1("How has the Popularity of Movie Genres Changed From 1990-2020?")
    ),
    sidebarLayout(
      scatter_sidebar_content,
      scatter_main_content
    ),
    tags$footer(tags$p(
      "Gisele Fox, Emiri Nishizawa, Melina Perraut, Roshni Srikanth,
    Ha Nhat To: ",
      tags$a(
        id = "url",
        href = "https://github.com/info-201a-au20/final-project-movies",
        "Github URL"
      )
    ))
  )
)
