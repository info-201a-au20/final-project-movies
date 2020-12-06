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


bar_sidebar_panel <- sidebarPanel(
  inputId = "bar_sidebar",
  measurement_input
)

bar_main_panel <- mainPanel(
  inputId <- "bar_main",
  plotlyOutput("bar")
)

bar_page <- tabPanel (
  "barchart",
  titlePanel("Revenue and Budget metrics of Movie industry (1990 - 2020)"),
  sidebarLayout(
    bar_sidebar_panel,
    bar_main_panel
  )
)
