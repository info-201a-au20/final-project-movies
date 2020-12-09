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

# UI
ui <- navbarPage(
  # theme
  windowTitle = "The Movie Times",
  theme = shinytheme("united"),
  title = tags$p(id = "change_title_font", "The Movie Times"),

  # Intro page
  intro_page,

  # Scatter page
  scatter_page,

  # Bar page
  bar_page,

  # Line page
  line_page,

  # Summary page
  summary_page

)
