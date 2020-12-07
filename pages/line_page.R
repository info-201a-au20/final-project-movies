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
  ),
  radioButtons(
    inputId = "quarantine_button",
    label = "US Quarantine View",
    choices = c("View by Slider" = "slider",
                "Zoom into March 2020" = "zoom"
                )
  )
)


# Main Panel
main_line <- mainPanel(
  h1("How has the 2020 Coronavirus Pandemic Affected Pandemic Related Movies?"),
  plotlyOutput("linegraph"),
  p("This data was sourced from the website googletrends.com. The points
    represents search interest relative to the highest point on the chart 
    for the given time (one year after the movie was released up until Nov 
    2020). A value of 100 is the peak popularity for the term. A value of 50 
    means that the term is half as popular. A score of 0 means there was not 
    enough data for this term.")
)


# All together
line_page <- tabPanel(
  "Linegraph (experiment)",
  sidebar_line,
  main_line
)


