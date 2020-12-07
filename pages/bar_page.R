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
  inputId <- "bar_main",
  plotlyOutput("bar")
)

bar_page <- tabPanel (
  "barchart",
  titlePanel(
    tags$h1("Revenue and Budget metrics of Movie industry (1990 - 2020)")),
  sidebarLayout(
    bar_sidebar_panel,
    bar_main_panel
  )
)
