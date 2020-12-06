# UI
library(shiny)
library(ggplot2)
library(plotly)


# Sourcing Pages
source("./pages/overview_page.R")
source("./pages/scatter_page.R")
source("./pages/bar_page.R")
source("pages/line_page.R")
source("./pages/summary_page.R")


# First Page (introduction)


# Second Page (interactive chart 1)

# Creating a `sidebarPanel()` for the scatterplot page that contains a
# `selectInput` widget for selecting a movie genre to plot
scatter_sidebar_content <- sidebarPanel(
  selectInput( # starting out with single input, may change to checkboxGroupInput
    inputId = "genre_var",
    label = "Select a movie genre: ",
    choices = list(
      # list out genre options
      "Action" = "action"
    )
  )
)

# Creating a `mainPanel()` for the scatterplot page that contains the
# `plotlyOutput()` of the scatter
scatter_main_content <- mainPanel(
  plotlyOutput("scatter")
)

# Creating a `tabPanel()` for the scatterplot page
scatter_panel <- tabPanel(
  "Scatterplot",

  titlePanel("Popularity of Individual Movie Genres From 1990-2020"),

  # Adding a titlePanel to your tab
  titlePanel("Popularity of Individual Movie Genres From 1990-2020"),

  # Creating a sidebar layout for this tab (page)
  sidebarLayout(
    scatter_sidebar_content,
    scatter_main_content

  )
)


# Third Page (interactive chart 2)


# Fourth Page (interactive chart 3)


# Fifth Page (summary)

# UI
ui <- navbarPage(

  title = "The Movie Times",
  # Intro page

  # Scatter page
  scatter_panel,

  # Bar page
  bar_page

  # Line page
  # Summary age

  #tableOutput("table")



)
