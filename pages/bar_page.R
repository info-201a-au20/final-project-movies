# Bar Chart Page
library(shiny)

# going to be focusing on budget and gross revenue
# users have the option of choosing between looking at
# the average, median, and total for budget or revenue

measurement_list <- list(
  "Average Budget" = "average_budget",
  "Median Budget" = "median_budget",
  "Total Budget" = "total_budget",
  "Average Revenue" = "average_revenue",
  "Median Revenue" = "median_revenue",
  "Total Revenue" = "total_revenue"
)

measurement_input <- selectInput(
  inputId = "measurement",
  label = "Metric",
  choices = measurement_list,
  selected = "Average Budget"
)

year_slider <- sliderInput(
    inputId = "year_slider",
    label = "Years",
    min = 1990,
    max = 2020,
    value = c(1990, 2020),
    round = TRUE,
    dragRange = TRUE
  )

bar_sidebar_panel <- sidebarPanel(
  inputId = "bar_sidebar",
  measurement_input,
  year_slider
)

bar_main_panel <- mainPanel(
  plotlyOutput("bar"),
  tags$h2("About Chart:"),
  tags$p("One of the questions we wanted to answer
  with our data was how different national and global events impacted the movie
  industry. To answer this, this graph looks at the numbers for the money that
  is brought in and spent by the movie industry by year. To do this, the graph
  looks at three main values (average, median, and total) for either budget or
  revenue. The graph also has the option of specifiying a date range, to look
  at the impact of events of specific years on the movie industry. The
  significant events that we looked at were in 1991 (Introduction of the
  Internet), 1997 (Creation of Netflix), 2001 (9/11), 2005 (Creation of
  Youtube), 2008 (Great Recession), and 2020 (Coronavirus Pandemic)")
)

bar_page <- tabPanel(
  "Finance",
  fluidPage(
    includeCSS("styling.css"),
    titlePanel(
      tags$h1("Financial Metrics of the Movie industry (1990 - 2020)")),
    sidebarLayout(
      bar_sidebar_panel,
      bar_main_panel
    ),
    tags$footer(tags$p(
      "Gisele Fox, Emiri Nishizawa, Melina Perraut, Roshni Srikanth,
    Ha Nhat To: ",
      tags$a(id = "url",
             href = "https://github.com/info-201a-au20/final-project-movies",
             "Github URL")))
  )
)
