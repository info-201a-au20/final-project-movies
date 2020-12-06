# Line Chart Page

library(shiny)
library(ggplot2)
library(plotly)

# Sidebar Panel
sidebar_line <- sidebarPanel(
  sliderInput(
    inputId = "slider",
    label = "Years",
    min = 2010,
    max = 2021,
    value = c(2010, 2021),
    round = TRUE,
    dragRange = TRUE
  )
)


# Main Panel
main_line <- mainPanel(
  h1(textOutput("sliderexp")),
  plotOutput("linegraph")
)


# All together
line_page <- tabPanel(
  "Linegraph (experiment)",
  
  sidebar_line,
  main_line
)


