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


# Third Page (interactive chart 2)


# Fourth Page (interactive chart 3)


# Fifth Page (summary)

# UI
ui <- navbarPage(
  title = "Testing bar graph",
  #plotlyOutput("bar"),
  #tableOutput("table")
  scatter_page,
  bar_page
)
