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
    dragRange = TRUE,
    sep = ""
  ),
  radioButtons(
    inputId = "quarantine_button",
    label = "2020 US Quarantine View",
    choices = c("View by Slider" = "slider",
                "Zoom into March 2020" = "zoom"
                )
  )
)


# Main Panel
main_line <- mainPanel(
  plotlyOutput("linegraph"),
  h2("About the Line Graph:"),
  p("One of the questions we wanted to answer was has the 2020 COVID
    pandemic negatively or positively affect the popularity of pandemic
    related movies.
    We can analyze that question through this chart that shows the search
    interest of
    pandemic related movies from a year after they were released until November
    2020 with a white dotted line at March 2020 signifyng the start of US
    quarantine for COVID."),
  p("This data was sourced from the website googletrends.com. The points
    represent the movie's google search interest relative to the highest
    point on the chart for the given movie and time frame. A value of 100 is
    the peak popularity for the term. A
    value of 50 means that the term is half as popular. A score of 0 means there
    was not enough data for this term.")
)


# All together
line_page <- tabPanel(
  "Pandemic Movies Resurgence",
  fluidPage(
    includeCSS("styling.css"),
    titlePanel(
      tags$h1(
        "How has the 2020 Coronavirus Pandemic Affected Pandemic Related
        Movies?")
      ),
    sidebarLayout(
      sidebar_line,
      main_line
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
