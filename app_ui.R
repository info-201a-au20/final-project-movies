# UI
library(shiny)
library(ggplot2)
library(plotly)
# First Page (introduction)


# Second Page (interactive chart 1)


# Third Page (interactive chart 2)


# Fourth Page (interactive chart 3)


# Fifth Page (summary)

# UI 
ui <- fluidPage(
  title = "Testing bar graph",
  plotlyOutput("bar"),
  tableOutput("table")
)
